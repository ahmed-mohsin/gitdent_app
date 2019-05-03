import 'package:flutter/material.dart';
import 'tutorailModel.dart';
import 'casesModel.dart';
import 'toolsModel.dart';

class Mydrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.8,
      child: Drawer(
        child: ListView(

          physics: BouncingScrollPhysics(),
          children: <Widget>[
            DrawerHeader( child: Column(
              children: <Widget>[
                CircleAvatar(

                          backgroundImage: AssetImage("assets/am.jpg"),


                          radius: 40,

                          backgroundColor: Colors.teal,

                        ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("hello  ahmad",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),),
                )
              ],
            ),),
            ListTile(
              selected: true,
              leading:Icon(Icons.beach_access,color: Colors.teal,),
              title: Text('Tutorial',style: TextStyle(color: Colors.teal)),
              subtitle: Text("new tutorials , courses ",style: TextStyle(color: Colors.grey),),
              onTap: (){
                //Navigator.of(context).pushNamed('/tutbody');

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tutbody()),
                );
              },
            ),
            ListTile(
              selected: true,
              leading:Icon(Icons.beach_access,color: Colors.teal,),
              title: Text('Cases',style: TextStyle(color: Colors.teal)),
              subtitle: Text("Cases discussions , pics and videos ",style: TextStyle(color: Colors.grey),),
              onTap: (){
                //Navigator.of(context).pushNamed('/casebody');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => caseBody()),
                );
              },
            ),
            ListTile(
              selected: true,
              leading:Icon(Icons.beach_access,color: Colors.teal),
              title: Text('Tools',style: TextStyle(color: Colors.teal)),
              subtitle: Text("all the new about tools and instruments ",style: TextStyle(color: Colors.grey),),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => toolBody()),
                );
              },
            ),
            ListTile(
              selected: true,
              leading:Icon(Icons.beach_access,color: Colors.teal),
              title: Text('Lab',style: TextStyle(color: Colors.teal)),
              subtitle: Text("new about lab and tech ",style: TextStyle(color: Colors.grey),),
              onTap: (){},
            ),
            ListTile(
              selected: true,
              leading:Icon(Icons.beach_access,color: Colors.teal),
              title: Text('Market',style: TextStyle(color: Colors.teal)),
              subtitle: Text("buy and sell from the dent app ",style: TextStyle(color: Colors.grey),),
              onTap: (){},
            ),
            ListTile(
              selected: true,
              leading:Icon(Icons.beach_access,color: Colors.teal),
              title: Text('Events',style: TextStyle(color: Colors.teal)),
              subtitle: Text("Create and attend Events ",style: TextStyle(color: Colors.grey),),
              onTap: (){
                Navigator.of(context).pushNamed('/tutbody');
              },
            ),


          ],
        ),
      ),
    );
  }
}

