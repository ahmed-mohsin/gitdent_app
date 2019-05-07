import 'package:flutter/material.dart';
import 'package:dent_app/ui/listv-item-fromtutos.dart';

class Mybody extends StatefulWidget {
  @override
  _MybodyState createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
          new conty(),
        ],
      ),
    );
  }
}

class conty extends StatelessWidget {
  const conty({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListvItemfromTutorial()),
      );
    },
      child: Card(
        elevation: .6,
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade50,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/am.jpg'),
                      ),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(" Ahmed Mohsin  ",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 5,top: 3),
                          child: Text("21 April 2019",style: TextStyle(color: Colors.grey,fontSize: 12),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 220,
                child: Image(
                  image: AssetImage('assets/art.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "building the first object from the class Shop ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                  child: Text(
                      "building the first object from the class Shop and building the first object from the class Shop and the first object from the class Shop  and passing and passing ........",
                      style: TextStyle(fontSize: 10,color: Colors.grey)),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: FlatButton(onPressed: (){}, child: Text("200 likes",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.teal,
                            )),)
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: FlatButton(onPressed: (){}, child: Text(" 150 Comments",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          )),),
                    ),

                    InkWell(
                      onTap: (){},
                      child: Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: FlatButton(onPressed: (){}, child: Text("Share",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              )),)
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






















