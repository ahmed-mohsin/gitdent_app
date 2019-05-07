import 'package:flutter/material.dart';

class searchActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(
        height: 200,
        width: 200,
        child: Image(
        image: AssetImage("assets/un.png"),fit: BoxFit.fill,
    )),
    SizedBox(height: 10,),
    Text(
    "hello  from search arena",
    textDirection: TextDirection.ltr,
    ),
    Text(
    "here you Will search in posts cases ",
    textDirection: TextDirection.ltr,
    ),
    ],
    ),
    ),
    )
    );
  }
}
