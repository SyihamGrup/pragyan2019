import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseDatabase database=FirebaseDatabase.instance;
class IotDevices extends StatefulWidget {
  @override
  _IotDevicesState createState() => _IotDevicesState();
}

class _IotDevicesState extends State<IotDevices> {


  String _water_text="false";
  void listenToFirebase() {
    setState(() {
      database.reference().once().then((DataSnapshot snapshot) {
        var reminder_text = snapshot.value;
        print(reminder_text["Water_leakage"]);
        _water_text = reminder_text["Water_leakage"];
      });
    });
    Future.delayed(const Duration(milliseconds: 2000), () {
      listenToFirebase();
    });
  }

  @override
  void initState() {
    listenToFirebase();
    super.initState();
  }

  Widget build(BuildContext context) {

    return (new Scaffold(
        appBar: new AppBar(
          title: new Text(" IoT Devices"),
          backgroundColor: Colors.amberAccent,
        ),
        body: new Container(child: ListView(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(15.0)),
            new ListTile(
              title: new Text("Water Leakage",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 16.0),
              ),
              subtitle: new Text("$_water_text",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: new Icon(Icons.error)
              ),
            ),
            new Padding(padding: EdgeInsets.all(8.0)),
            new ListTile(
              title: new Text("Temperature Device",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 14.0),
              ),
              subtitle: new Text("Connection Required",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 12.0),
              ),
              leading: CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  child: new Icon(Icons.brightness_high)
              ),
            ),
            new Padding(padding: EdgeInsets.all(8.0)),
            new ListTile(
              title: new Text("Moisture Device",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 14.0),
              ),
              subtitle: new Text("Connection Required",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 12.0),
              ),
              leading: CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  child: new Icon(Icons.blur_circular)
              ),
            ),
            new Padding(padding: EdgeInsets.all(8.0)),
            new ListTile(
              title: new Text("PH Device",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 14.0),
              ),
              subtitle: new Text("Connection Required",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 12.0),
              ),
              leading: CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  child: new Icon(Icons.colorize)
              ),
            ),
            new Container(margin: EdgeInsets.fromLTRB(250.0, 300.0, 00.0, 0.0),
            child:   new  FloatingActionButton(onPressed: listenToFirebase, backgroundColor: Colors.amber,
              foregroundColor:Colors.blueAccent,
              highlightElevation: 5.0,
              child: new Icon(Icons.add),

            )
            ),
        new Container(margin: EdgeInsets.fromLTRB(300.0, 10.0, 00.0, 0.0),
            child: Text("Add Device",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14.0, ),
            ),
        )
          ],
        )
        )
    )
    );
  }

  nothing() {
    print("Add device");
  }
}
