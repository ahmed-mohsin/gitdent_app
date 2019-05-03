import 'package:flutter/material.dart';
import 'ui_bottomnavbar.dart';
import 'myDravver.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_simple_video_player/flutter_simple_video_player.dart';
import 'ui_Mybody.dart';
import 'addCase.dart';

class caseBody extends StatefulWidget {
  @override
  _caseBodyState createState() => _caseBodyState();
}

class _caseBodyState extends State<caseBody> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white70.withAlpha(240),
          appBar: AppBar(
              backgroundColor: Colors.teal,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                "Cases Gallary",
                style: TextStyle(color: Colors.white),
              )),
          floatingActionButton: SizedBox(
              child: FloatingActionButton(
                  backgroundColor: Colors.grey.shade50,
                  child: Icon(
                    Icons.add,
                    color: Colors.teal,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCase()),
                    );
                  })),
          drawer: Mydrawer(),
          body: new casesBody(),
          bottomNavigationBar: BottomnavBar()),
    );
  }
}

class casesBody extends StatefulWidget {
  const casesBody({
    Key key,
  }) : super(key: key);

  @override
  _casesBodyState createState() => _casesBodyState();
}

class _casesBodyState extends State<casesBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.shade100,
        child: StreamBuilder(
            stream: Firestore.instance
                .collection('cases')
                .orderBy('likes', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: Text(
                  "Loading",
                  style: TextStyle(fontSize: 25),
                ));
              }
              var casedata = snapshot.data;
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot caseSnapshot =
                        snapshot.data.documents[index];
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      '${caseSnapshot['profileimg']}'),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('${caseSnapshot['username']}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 3),
                                    child: Text(
                                      '${caseSnapshot['date']}',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .50,
                            child: Image(
                              image: NetworkImage('${caseSnapshot['img']}'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, top: 4, right: 8),
                            child: Text(
                              '${caseSnapshot['description']}',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: FlatButton(
                                        onPressed: () {},
                                        child: Text(
                                            '${caseSnapshot['likes'].toString()}' +
                                                ' likes',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.teal,
                                            )),
                                      )),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                        '${caseSnapshot['comments'].toString()}' +
                                            ' comments',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: FlatButton(
                                        onPressed: () {},
                                        child: Text("Share",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            )),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                            child: Container(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }));
  }
}


/*PhotoView(customSize: Size.fromHeight(300),
                                imageProvider: NetworkImage('${caseSnapshot['img']}'),
                                backgroundDecoration:
                                    BoxDecoration(color: Colors.white),
                                //enableRotation: true,
                              ))*/