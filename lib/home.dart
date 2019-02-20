import "dart:async";
import "dart:convert";
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:weather/crops.dart';
import 'package:weather/cropRotation.dart';
import 'package:weather/ferti.dart';
import 'package:weather/iot.dart';
import 'package:weather/mandi.dart';
import 'package:weather/blog.dart';


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
  Future _cropRotation(BuildContext context) async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(builder: (BuildContext context) {
          return new CropRotation();
        }));
    // _city=results['enter'];
  }
  Future _iotDevices(BuildContext context) async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(builder: (BuildContext context) {
          return new IotDevices();
        }));
    // _city=results['enter'];
  }
  Future _ferti(BuildContext context) async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(builder: (BuildContext context) {
          return new Fertilizers();
        }));
    // _city=results['enter'];
  }
  Future _mandi(BuildContext context) async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(builder: (BuildContext context) {
          return new Mandi();
        }));
    // _city=results['enter'];
  }
  Future _blog(BuildContext context) async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(builder: (BuildContext context) {
          return new Blog();
        }));
    // _city=results['enter'];
  }


  Widget build(BuildContext context) {
    return(new Scaffold(
        appBar: new AppBar(
          title: Text("Agritech",style:new TextStyle(
            fontSize: 24.0,
          ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.lightGreen,
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.location_city), onPressed: ()=>_goToNextScreen(context))
          ],
        ),
        body: new Stack(
          children: <Widget>[

            new Image.asset("images/background.jpg",
              width: 700.0,
              height:800.0,
              fit: BoxFit.fill,
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
                child: new Image.asset("images/light_rain.png",
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
        //new Padding(padding: EdgeInsets.all(value))
        DrawerHeader(
          child: new Container(child:new Text("Menu",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24.0),
          ),
          ),

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
            _cropRotation(context);
            // Update the state of the app
            // ...
            // Then close the drawer
           // Navigator.pop(context);
          },
        ),
        ListTile(
          title: new Text("IOT Devices",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18.0)
          ),
          onTap: () {
            _iotDevices(context);
            // Update the state of the app
            // ...
            // Then close the drawer
            // Navigator.pop(context);
          },
        ),
        ListTile(
          title: new Text("Fertilizers",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18.0)
          ),
          onTap: () {
            _ferti(context);
            // Update the state of the app
            // ...
            // Then close the drawer
            // Navigator.pop(context);
          },
        ),ListTile(
          title: new Text("Mandi",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18.0)
          ),
          onTap: () {
            _mandi(context);
            // Update the state of the app
            // ...
            // Then close the drawer
            // Navigator.pop(context);
          },
        ),
        ListTile(
          title: new Text("Blog",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18.0)
          ),
          onTap: () {
            _blog(context);
            // Update the state of the app
            // ...
            // Then close the drawer
            // Navigator.pop(context);
          },
        ),
      ],
    ),
    ),
    ));
  }

  submit_reminder() async {
setState(() {
  var result=  database.reference().child("Message").set({" Reminder": "${_reminder.text}"});
  print(_reminder.text);
  database.reference().once().then((DataSnapshot snapshot) {
    var reminder_text=snapshot.value;
    print (reminder_text["Message"]);
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
                  child: new Icon(Icons.wb_sunny),
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
                  child: new Icon(Icons.invert_colors),
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
                  child: new Icon(Icons.swap_calls),
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

                  fontSize: 22.0,
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
                title: new Text("null km/h", style: new TextStyle(

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
        ],
      )
      );
    }

  }
  );
}
