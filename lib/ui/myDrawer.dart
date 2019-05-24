import 'package:dent_app/auth/getdatafromsharedpref.dart';
import 'package:dent_app/drawerElements/casesModel.dart';
import 'package:dent_app/auth/logIn.dart';
import 'package:dent_app/drawerElements/labsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'tutorailModel.dart';

//import 'package:dent_app/Cases/casesModel.dart';
import 'package:dent_app/drawerElements/toolsModel.dart';

class Mydrawer extends StatefulWidget {
  @override
  _MydrawerState createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  String name;
  String imageUrl;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /*setName() {
    getuserName().then((value) {
      setState(() {
        //name = value;
      });
    });
  }

  setImage() {
    getuserProfileImage().then((value) {
      setState(() {
        imageUrl = value;
      });
    });
  }
*/

  _logOut() async {
    await _auth.signOut().then((value) {
      print("***** log out");
      //Navigator.pop(context);
      //Navigator.popUntil(context, ModalRoute.withName("/login"));
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => LogPage()));
    });
    // Navigator.popUntil(context, ModalRoute.withName("/login"));
  }

  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((firebaseUser) {
      if (firebaseUser == null) {
        //signed out
      } else {
        print("succeful log in");
        setState(() {
          name = firebaseUser.displayName;
          imageUrl = firebaseUser.photoUrl;
        });

        //signed in
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage("$imageUrl"),
                    radius: 40,
                    backgroundColor: Colors.teal,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "$name",
                      style: TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              selected: true,
              leading: Icon(
                Icons.beach_access,
                color: Colors.teal,
              ),
              title: Text('Cases', style: TextStyle(color: Colors.teal)),
              subtitle: Text(
                "Cases discussions , pics and videos ",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                //Navigator.of(context).pushNamed('/casebody');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => caseBody()),
                );
              },
            ),
            ListTile(
              selected: true,
              leading: Icon(
                Icons.beach_access,
                color: Colors.teal,
              ),
              title: Text('Lab', style: TextStyle(color: Colors.teal)),
              subtitle: Text(
                "all the new in the labs and tech ",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                //Navigator.of(context).pushNamed('/casebody');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LabBody()),
                );
              },
            ),
            ListTile(
              selected: true,
              leading: Icon(
                Icons.beach_access,
                color: Colors.teal,
              ),
              title: Text('Tutorial', style: TextStyle(color: Colors.teal)),
              subtitle: Text(
                "new tutorials , courses ",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                //Navigator.of(context).pushNamed('/tutbody');

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tutbody()),
                );
              },
            ),
            ListTile(
              selected: true,
              leading: Icon(Icons.beach_access, color: Colors.teal),
              title: Text('Tools', style: TextStyle(color: Colors.teal)),
              subtitle: Text(
                "all the new about tools and instruments ",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => toolBody()),
                );
              },
            ),
            ListTile(
              selected: true,
              leading: Icon(Icons.beach_access, color: Colors.teal),
              title: Text('Lab', style: TextStyle(color: Colors.teal)),
              subtitle: Text(
                "new about lab and tech ",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),
            ListTile(
              selected: true,
              leading: Icon(Icons.beach_access, color: Colors.teal),
              title: Text('Market', style: TextStyle(color: Colors.teal)),
              subtitle: Text(
                "buy and sell from the dent app ",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),
            ListTile(
              selected: true,
              leading: Icon(Icons.beach_access, color: Colors.teal),
              title: Text('Events', style: TextStyle(color: Colors.teal)),
              subtitle: Text(
                "Create and attend Events ",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/tutbody');
              },
            ),
          ],
        ),
      ),
    );
  }
}
