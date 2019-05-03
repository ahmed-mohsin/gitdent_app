import 'package:flutter/material.dart';
import 'ui_myapp.dart';

class logIn extends StatefulWidget {
  @override
  _logInState createState() => _logInState();
}

class _logInState extends State<logIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/myapp': (BuildContext context) => MyApp(),
      },
      home: Scaffold(
        body: Container(
          color: Colors.teal,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 70,
                  child: Image(image: AssetImage('assets/ff.png')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "DentApp ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                    child: Text(
                  "your gate to all the new about dentists stuffs  cases materails , tools , labs ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: Builder(
          builder: (context) => Container(
                color: Colors.teal,
                height: 70,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 35,
                      child: MaterialButton(
                        //onPressed:  () => Navigator.of(context).pushNamed('/myapp')
                        onPressed: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyApp())),
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.teal,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "or SignUp",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
