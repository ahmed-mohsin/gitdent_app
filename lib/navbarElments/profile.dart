import 'package:flutter/material.dart';

class profileActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
