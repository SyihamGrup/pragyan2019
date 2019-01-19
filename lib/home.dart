import "dart:async";
import "dart:convert";

import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:weather/guidance.dart';


final FirebaseDatabase database=FirebaseDatabase.instance;

class ChangeCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _newTextController= new TextEditingController();

    return (new Scaffold(
        appBar: new AppBar(
          title: new Text("ChangeCity"),
          backgroundColor: Colors.redAccent,
        ),
        body: new Stack(
          children: <Widget>[
            new ListView(
              children: <Widget>[
                new TextField(
                  decoration:new InputDecoration(
                      labelText: "Enter city",
                      hintText: "City in India",

                  ),
                  controller: _newTextController,
                ),
                new FlatButton(onPressed: (){
                  Navigator.pop(context,{
                    'enter':_newTextController.text
                  }
                  );
                },
                  child: new Text("Send"),
                  color: Colors.red,

                )

              ],
            ),


          ],
        )

    ));
  }
}


class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}

class HomeState extends State<home> {
  @override
  String _city='chennai';
  var _reminder= new TextEditingController();
  String reminder_text= "";

  //String temperature;
  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(builder: (BuildContext context) {
          return new ChangeCity();
        }));
    _city=results['enter'];
  }
  Future _guidance(BuildContext context) async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(builder: (BuildContext context) {
          return new Guidance();
        }));
   // _city=results['enter'];
  }

  Widget build(BuildContext context) {
    return(new Scaffold(
        appBar: new AppBar(
          title: Text("Agritech",style:new TextStyle(
            fontSize: 28.0,
          )
          ),
          backgroundColor: Colors.lightGreen,
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.location_city), onPressed: ()=>_goToNextScreen(context))
          ],
        ),
        body: new Stack(
          children: <Widget>[
            new Image.asset("/Users/ashukumar/IdeaProjects/weather/images/background.jpg",
              width: 700.0,
              height:800.0,
              fit: BoxFit.fitHeight,
            ),
            new Container
              (alignment: Alignment.topRight,
                margin: EdgeInsets.fromLTRB(0.0, 15.0, 30.0, 0.0),
                child:new Text("${_city}",
                    style: new TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    )
                )
            ),
            new Container(
//                alignment: Alignment.center,
                child: new Image.asset("/Users/ashukumar/IdeaProjects/weather/images/light_rain.png",
                  height: 300.0,width:400.0,)
            ),
            new Container
              (//alignment: Alignment.bottomLeft,
                margin: EdgeInsets.fromLTRB(100.0, 250.0, 00.0, 0.0),
                child:  futurewidget("$_city")
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(10.0, 600.0, 0.0, 00.0),
                child: ListView(
                  children: <Widget>[
                    new Text("${reminder_text}",
                    style: new TextStyle(color: Colors.white),),
                    new Padding(padding: EdgeInsets.all(15.0)),
                    TextField(
                      decoration: new InputDecoration(
                      labelText: "Add New Reminder",
                      labelStyle: new TextStyle(color: Colors.white, fontSize: 28.0, fontStyle: FontStyle.normal),
                      hintText: "Enter current Goals",
                        fillColor:  Colors.amberAccent,

                  ),
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 18.0),
                  controller: _reminder,

                ),
                    new FlatButton(onPressed :()=> submit_reminder(), child: new Text("Set Reminder", style: new TextStyle(
                      color: Colors.redAccent, fontSize: 18.0, fontWeight: FontWeight.w600
                    ),))
                ],)
            ),
          ],
        ),


      //+++++++++++++++++++++++++  DRAWER   ++++++++++++++++++++++++++++++++++++++++++++

      drawer: Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Menu'),
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
        ),
        ListTile(
          title: new Text("Utility and Guidance",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18.0),
        ),

      onTap: () {
            _guidance(context);
            // Update the state of the app
            // ...
            // Then close the drawer
            //Navigator.pop(context);
          },
        ),
        ListTile(
          title: new Text("Crop Rotation",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18.0)
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ],
    ),
    ),
    ));
  }

  submit_reminder() {
setState(() {
  database.reference().child("Message").set({" Reminder": "${_reminder.text}"});
  database.reference().once().then((DataSnapshot snapshot) {
    reminder_text=snapshot.value.toString();
  });
  _reminder.clear();
});
  }
}








//-------------------JSON------------------------------------------
Future<Map> getResponse(String city) async
{
  String apiUrl="https://api.openweathermap.org/data/2.5/forecast?q=$city,IN&appid=8a412833abadabe8814e53d470cd43e6";
  http.Response response= await http.get(apiUrl);
  return jsonDecode(response.body);
}












Widget futurewidget (String city)
{
  return new FutureBuilder(future: getResponse(city),builder: (BuildContext context,AsyncSnapshot<Map> snapshot)
  {
    if(snapshot.hasData)
    {
      Map data=snapshot.data;
      double temp=data['list'][0]['main']['temp']-273.ceil();
      var temp_humidity=data['list'][0]['main']['humidity'];
      var temp_wind=data['list'][0]['wind']['speed'];


      String temperature=temp.toStringAsFixed(2);
      String humidity=temp_humidity.toString();
      String wind=temp_wind.toStringAsFixed(2);

      return new Container(
          child: new Column(
            children: <Widget>[
              new ListTile(
                title: new Text("$temperature °C",style: new TextStyle(

                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                )),
                leading: new CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text("T"),
                ),
              ),
              new ListTile(
                title: new Text("$humidity g/m3", style: new TextStyle(

                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                )
                ),
                leading: new CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text("H"),
                ),)
              ,
              new ListTile(
                title: new Text("$wind km/h", style: new TextStyle(

                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                )
                ),
                leading: new CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text("W"),
                ),)
            ],
          )
      );
    }
    else {
      return ( new Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new ListTile(
                title: new Text("null °C", style: new TextStyle(

                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                )
                ),
                leading: new CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text("T"),
                ),),
              new ListTile(
                title: new Text("null g/m3", style: new TextStyle(

                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                )
                ),
                leading: new CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text("H"),
                ),)
              ,
              new ListTile(
                title: new Text("null km/h", style: new TextStyle(

                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                )
                ),
                leading: new CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text("W"),
                ),)
            ],
          )
        ],
      )
      );
    }

  }
  );
}
