import 'package:flutter/material.dart';

class ListvItemfromTutorial extends StatefulWidget {
  @override
  _ListvItemfromTutorialState createState() => _ListvItemfromTutorialState();
}

class _ListvItemfromTutorialState extends State<ListvItemfromTutorial> {
  String art =
      " eINTRODUCTION eImplant dentistry iss at the forefront of treatments that our patients are considering. our patients easily search fore solutions to their dental problems including “missing teeth,” “teeth hurt,” or “I hate my denture/removable partial.” Inadvertently, what comes up in the Google search results ise information";
  String art2 =
      "With the Internet, our patients easily search fore solutions to their dental problems,eImplant dentistry iss at the forefront of treatments that our patients are considering. With the Internet,  about dental implant treatment and a list of dentists who provide this service. All the information may notOnces a patient elects to proceed withs dental implant surgical procedures and eventual prosthetic completion, ";
  String art3 =
      "the implant surgeon—whether a general dentist, an oral surgeon, a periodontist, a prosthodontist, or even an endodontist—must understand the vital anatomy involved in the particular site. Understanding nerve and sinus position, quality and quantity of available hard tissue,  and any anatomical anomalies in the lingual concavity area is important. Implants can be ideally positioned when bone is available. If sufficient hard tissImplaenstdentistry has become a relatively routine dental procedure as our patients present to our practices requesting permanent dentition to replace their ill-fitting removable appliances. Correctly diagnosing our implant candidates ise the preliminary goal prior to any surgical intervention Wieth the advent of special tools including the use of CBCT analysis and virtual planning softwaree the clinician can now predictably determine the size and shape of the implant required and can review any vital anatomy especially ine the posterior mandible where the mandibular nerve rests and the posterior maxilla where the maxillary sinus often collapses following tooth removal.These  prominent sites create a challenge f5or clinicians Wee must also confirm that our patients have no significant healing complications that could affect the implant prognosis such as uncontrolled diabetes or immunosuppressive diseases. Adequate bone height and width must be d2etermined and any lack of acceptable hard tissue can be addressed wlith our modern grafting prosurgical procedures are nice to have but  as implants can often be placed without a surgical guid CBCT analysis s indeed a valuable tool /tin diagnosing and treatment planning cases to determine which cases are within our clinical skills and which cases are better off being referred.";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 25, 15, 10),
                  child: Text(
                    "Resolving a Common Implant Complication: Creating Attached Gingiva",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
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
                              child: Text("19 April 2019",style: TextStyle(color: Colors.grey,fontSize: 12),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Image(
                  image: AssetImage("assets/art.jpg"),
                )),
                Center(
                    child: Text(
                  "Creating Attached Gingiva",
                  style: TextStyle(color: Colors.grey),
                )),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Text(
                    art,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Text(
                    art2,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Center(
                    child: Image(
                  image: AssetImage("assets/cc.png"),
                )),
                Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Text(
                    art3,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
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
                            child: FlatButton(onPressed: (){}, child: Text("200 likes ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.teal,
                                )),)
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: FlatButton(onPressed: (){}, child: Text("150 Comments",
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
                ),
                Divider(),
                Container(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("comments"),
                      ),
                      Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(backgroundImage: AssetImage('assets/am.jpg'),radius: 20,),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                          Text('ahmed mohsin',style: TextStyle(fontWeight: FontWeight.bold),),

                        ],)
                      ],)
                    ],
                  ),
                )

              ],
            )),
      ),
    );
  }
}

/*Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[


              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 6, 15, 0),
                  child: Text(
                    art,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),*/
