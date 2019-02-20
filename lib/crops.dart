import 'package:flutter/material.dart';
import 'package:weather/rice.dart';
import 'package:weather/wheat.dart';


class Guidance extends StatelessWidget {
  @override
  
  
  Widget build(BuildContext context) {
    Future _rice(BuildContext context) async {
      Map results = await Navigator.of(context).push(
          new MaterialPageRoute<Map>(builder: (BuildContext context) {
            return new Rice();
          }));
      // _city=results['enter'];
    } 
    Future _wheat(BuildContext context) async {
      Map results = await Navigator.of(context).push(
          new MaterialPageRoute<Map>(builder: (BuildContext context) {
            return new Wheat();
          }));
      // _city=results['enter'];
    }
    return (new Scaffold(
        appBar: new AppBar(
          title: new Text("Utility and Guidance"),
          backgroundColor: Colors.redAccent,
        ),
        body: new ListView(
          children: <Widget>[

        new Padding(padding: EdgeInsets.all(10.0)),
            new Text("Select Your Crop",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new ListTile(
                title: Image.asset("images/rice.png",
                  width: 170.0,
                  height:170.0,
                  //fit: BoxFit.scaleDown,
                )),
            new FlatButton(onPressed :()=> _rice(context), child: new Text("Rice", style: new TextStyle(
                color: Colors.redAccent, fontSize: 18.0, fontWeight: FontWeight.w600
            ),)),
            new ListTile(
                title: Image.asset("images/wheat.png",
                  width: 120.0,
                  height:120.0,
                  //fit: BoxFit.scaleDown,
                )),
            new FlatButton(onPressed :()=> _wheat(context), child: new Text("Wheat", style: new TextStyle(
                color: Colors.redAccent, fontSize: 18.0, fontWeight: FontWeight.w600
            ),)),
          ],
        )

    ));
  }
}

