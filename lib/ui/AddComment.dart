import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'addCase.dart';

class AddComment extends StatelessWidget {
  String PostId, tf;
  String id, postBody, date;

  AddComment(this.PostId);

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
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "  $PostId",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.teal,
                        fontWeight: FontWeight.w900),
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
                          hintText: "",
                          fillColor: Colors.amber),
                    ),
                  ),
                  FlatButton(
                    onPressed: setDataToFirebase,
                    child: Text("add comment"),
                  ),
                  //Container(color: Colors.blueGrey,height: 2,width: MediaQuery.of(context).size.width,),
                  Expanded(
                    child: Container(
                        color: Colors.teal,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: StreamBuilder(
                            stream: Firestore.instance
                                .collection('cases')
                                .document(PostId)
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
                                                      Text("user name",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                      Text(
                                                          '${caseSnapshot['date']}'),
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
                  )
                ],
              ),
            ),
          )),
    );
  }

  void setDataToFirebase() {
    Map<String, dynamic> postData = {
      'userID': "amo",
      'date': "${getDateofnow()}",
      'postBody': tf
    };

    Firestore.instance
        .collection('cases')
        .document(PostId)
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
