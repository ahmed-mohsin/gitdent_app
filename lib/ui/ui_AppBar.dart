import 'package:flutter/material.dart';

// ignore: camel_case_types
class myAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      elevation: 0.0,
      centerTitle: true,
      title: FlutterLogo(colors: Colors.grey,),
    );
  }
}
