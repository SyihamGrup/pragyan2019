import 'package:flutter/material.dart';

class Guidance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _newTextController= new TextEditingController();

    return (new Scaffold(
        appBar: new AppBar(
          title: new Text("Utility and Guidance"),
          backgroundColor: Colors.redAccent,
        ),
        body: new ListView(
children: <Widget>[
  new Container(
    child: Image.asset("/Users/ashukumar/IdeaProjects/weather/images/light_rain.png",
    color: Colors.black,
    width: 200.0,
    height:200.0,
    fit: BoxFit.scaleDown,
  )),
  new Container(
      child: Image.asset("/Users/ashukumar/IdeaProjects/weather/images/background.jpg",
        width: 200.0,
        height:200.0,
        fit: BoxFit.scaleDown,
      )),
  new Container(
      child: Image.asset("/Users/ashukumar/IdeaProjects/weather/images/growth.png",
        width: 200.0,
        height:200.0,
        fit: BoxFit.scaleDown,
      )),
  new Container(
      child: Image.asset("/Users/ashukumar/IdeaProjects/weather/images/harvest.png",
        width: 200.0,
        height:200.0,
        fit: BoxFit.scaleDown,
      )),

],
        )

    ));
  }
}

