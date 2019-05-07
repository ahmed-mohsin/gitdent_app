import 'package:flutter/material.dart';
import 'ui_bottomnavbar.dart';
import 'myDravver.dart';
import 'package:dent_app/navbarElments/home.dart';
import 'tutorailModel.dart';
import 'listv-item-fromtutos.dart';
import 'casesModel.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/myapp': (BuildContext context) => new MyApp(),
        '/tutbody': (BuildContext context) => new Tutbody(),
        '/casebody': (BuildContext context) => new caseBody(),
      },
      home: Scaffold(
          backgroundColor: Colors.white70.withAlpha(240),
          appBar: AppBar(
            backgroundColor: Colors.teal,
            elevation: 0.0,
            centerTitle: true,
            title: FlutterLogo(colors: Colors.grey),
          ),
          floatingActionButton: SizedBox(
              child: FloatingActionButton(
                  backgroundColor: Colors.grey.shade50,
                  child: Icon(
                    Icons.add,
                    color: Colors.teal,
                  ),
                  onPressed: () {
                  })),
          drawer: Mydrawer(),
          body: Mybody(),
          bottomNavigationBar: BottomnavBar()),
    );
  }
}
