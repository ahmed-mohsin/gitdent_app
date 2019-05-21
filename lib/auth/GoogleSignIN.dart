import 'package:dent_app/ui/ui_myapp.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class newLogIn extends StatefulWidget {
  @override
  _newLogInState createState() => _newLogInState();
}

class _newLogInState extends State<newLogIn> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SharedPreferences _preferences;

  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    _preferences = await SharedPreferences.getInstance();
    isLogedin = await _googleSignIn.isSignedIn();
    if (isLogedin) {
      /*Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyApp()));*/
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignin() async {
    _preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);

    print("signed in " + user.displayName);

    if (user != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        Firestore.instance.collection("users").document(user.uid).setData({
          "id": user.uid,
          "username": user.displayName,
          "profilepic": user.photoUrl
        });
        await _preferences.setString("id", user.uid);
        await _preferences.setString("username", user.displayName);
        await _preferences.setString("photourl", user.photoUrl);
      } else {
        await _preferences.setString("id", documents[0]['id']);
        await _preferences.setString("username", documents[0]['username']);
        await _preferences.setString("photourl", documents[0]['photourl']);
      }

      print(user.displayName);
      setState(() {
        loading = false;
      });
    } else {
      /*Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyApp()));*/
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: FlatButton(
                onPressed: () {
                  handleSignin();
                },
                child: Text("log in")),
          ),
        ),
      ),
    );
  }
}
