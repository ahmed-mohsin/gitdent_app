import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dent_app/addingCenter/addpost.dart';

class AddComment extends StatefulWidget {
  String PostId;

  AddComment(this.PostId);

  @override
  _AddCommentState createState() => _AddCommentState(PostId);
}

class _AddCommentState extends State<AddComment> {
  String PostId, tf;
  String name, imageUrl;
  String id, postBody, date;

  _AddCommentState(String postId);

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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Column(
                children: <Widget>[

                  /*,Text(
                    "  ${widget.PostId}",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.teal,
                        fontWeight: FontWeight.w900),
                  ),*/

                  Expanded(
                    child: Container(
                        color: Colors.teal,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: StreamBuilder(
                            stream: Firestore.instance
                                .collection('cases')
                                .document(widget.PostId)
                                .collection("comments")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: Text(
                                  "Loading",
                                  style: TextStyle(fontSize: 25),
                                ));
                              } else
                                return Container(
                                  child: ListView.builder(
                                      itemCount: snapshot.data.documents.length,
                                      itemBuilder: (context, index) {
                                        DocumentSnapshot caseSnapshot =
                                            snapshot.data.documents[index];
                                        return Container(
                                            child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8, top: 8),
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage(
                                                        "${caseSnapshot['imageUrl']}"),
                                                    backgroundColor:
                                                    Colors.white,
                                                    radius: 25,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 12),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                          "${caseSnapshot['userName']}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                      Text(
                                                        '${caseSnapshot['date']}',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            color: Colors
                                                                .white),),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 55, top: 3, right: 35),
                                              child: Text(
                                                '${caseSnapshot['postBody']}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.white,
                                            ),
                                          ],
                                        ));
                                      }),
                                );
                            })),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onSubmitted: (text) {
                        setDataToFirebase();
                      },
                      onChanged: (text) {
                        tf = text;
                      },
                      maxLines: 4,
                      decoration: InputDecoration.collapsed(
                          border: OutlineInputBorder(
                              gapPadding: 30,
                              borderSide: BorderSide(
                                  color: Colors.teal,
                                  style: BorderStyle.solid)),
                          hintText: "  enter comment here",
                          fillColor: Colors.amber),
                    ),
                  ),
                  //Container(color: Colors.blueGrey,height: 2,width: MediaQuery.of(context).size.width,),
                  FlatButton(color: Colors.teal,
                    onPressed: setDataToFirebase,
                    child: Text(
                      "add comment", style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void setDataToFirebase() {
    Map<String, dynamic> postData = {
      'imageUrl': imageUrl,
      'userID': "amo",
      'userName': name,
      'date': "${getDateofnow()}",
      'postBody': tf

    };

    Firestore.instance
        .collection('cases')
        .document(widget.PostId)
        .collection("comments")
        .document()
        .setData(postData);
    print("upload done");
  }
}

/*Text(
                                              ('${caseSnapshot['userID']}'),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 15),
                                            ),
                                            Text(('${caseSnapshot['date']}'),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13),),
                                            Text(
                                                ('${caseSnapshot['postBody']}'),
                                              style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10),),
                                            Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Divider(
                                                color: Colors.white,
                                                height: 4,
                                              ),
                                            ),*/
