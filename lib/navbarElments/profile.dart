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
      if (firebaseUser == null) {} else {
        setState(() {
          name = firebaseUser.displayName;
          imageUrl = firebaseUser.photoUrl;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("wellcome  $name"),
            backgroundColor: Colors.teal,
            bottom: TabBar(tabs: _ktabs),

          ),
          body: TabBarView(children: _ktabPages),
        ));
  }
}

final _ktabs = <Tab>[
  Tab(icon: Icon(Icons.accessibility, color: Colors.white,),
    text: "liked posts",),
  Tab(icon: Icon(Icons.home, color: Colors.white,), text: "Saved posts",),
];


final _ktabPages = <Widget>[

  Center(child: Icon(Icons.add_shopping_cart, size: 60, color: Colors.red,),),
];

/*
Widget LikedItemsList(){
  return ListView.builder(itemBuilder: (){

  })
}*/