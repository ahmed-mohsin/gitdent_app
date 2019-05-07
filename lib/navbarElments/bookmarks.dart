import 'package:flutter/material.dart';

class bookmarksActivity extends StatelessWidget {
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
                  "hello  from bookmarks ",
                  textDirection: TextDirection.ltr,
                ),
                Text(
                  "here you Will  find your favorite posts  ",
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
        )
    );
  }
}
