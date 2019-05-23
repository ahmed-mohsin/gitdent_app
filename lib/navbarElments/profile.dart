import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profileActivity extends StatefulWidget {


  @override
  _profileActivityState createState() => _profileActivityState();
}

class _profileActivityState extends State<profileActivity> {
  String name, imageUrl;

  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((firebaseUser) {
      if (firebaseUser == null) {}
      else {
        print("succeful log in");
        name = firebaseUser.displayName;
        imageUrl = firebaseUser.photoUrl;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$name", style: TextStyle(fontSize: 30),)
            , Container(
                height: 200,
                width: 200,
                child: Image(
                  image: AssetImage("assets/un.png"),fit: BoxFit.fill,
                )),
            Text(
              "hello  from profile arena",
              textDirection: TextDirection.ltr,
            ),
            Text(
              "profile image",
              textDirection: TextDirection.ltr,
            ),
            Text(
              "CV",
              textDirection: TextDirection.ltr,
            ),
            Text(
              "user posts + cases + all adds",
              textDirection: TextDirection.ltr,
            )
          ],
        ),
      ),
    );
  }
}
