import 'package:flutter/material.dart';
import 'package:weather/json.dart';

class Wheat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void land_prep(BuildContext context)
    {
      Json ob=new Json();
      Map <dynamic,dynamic> data= ob.getJson();
      var alert= new AlertDialog(
        title: Text("Soil Suitable are - "),
        content: Text("${data["Crops"]["wheat"]["soil"].toString()}"),
        actions: <Widget>[
          FlatButton(
            child: new Text("ok"),
            onPressed: ()=>Navigator.pop(context),
          )
        ],
      );
      showDialog(context: context,builder: (context)=>alert);
    }
    void seed_sow(BuildContext context )
    {Json ob=new Json();
    Map <dynamic,dynamic> data= ob.getJson();
    var alert= new AlertDialog(
      title: Text("Seeds Details - "),
      content: Text("Seed Types- ${data["Crops"]["wheat"]["varieties"].toString()}\n "
          "Temperature- ${data["Crops"]["wheat"]["temp"].toString()}°C\n"" Rainfall -${data["Crops"]["wheat"]["rainfall"].toString()}m"),
      actions: <Widget>[
        FlatButton(
          child: new Text("ok"),
          onPressed: ()=>Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context,builder: (context)=>alert);
    }
    return (new Scaffold(
        appBar: new AppBar(
          title: new Text("Crop - Wheat"),
          backgroundColor: Colors.redAccent,
        ),
        body: new ListView(
          children: <Widget>[
            new ListTile(
                title: Image.asset("images/soilprep.png",
                  width: 200.0,
                  height:200.0,
                  //fit: BoxFit.scaleDown,
                )),
            new FlatButton(onPressed :()=> land_prep(context), child: new Text("Land Preparation", style: new TextStyle(
                color: Colors.redAccent, fontSize: 18.0, fontWeight: FontWeight.w600
            ),)),
            new ListTile(
                title: Image.asset("images/sowing.png",
                  width: 200.0,
                  height:200.0,
                  //fit: BoxFit.scaleDown,
                )),
            new FlatButton(onPressed :()=> seed_sow(context), child: new Text("Seed sowing", style: new TextStyle(
                color: Colors.redAccent, fontSize: 18.0, fontWeight: FontWeight.w600
            ),)),
            new ListTile(
                title: Image.asset("images/growth.png",
                  width: 150.0,
                  height:150.0,
                  //fit: BoxFit.scaleDown,
                )),
            new FlatButton(onPressed :()=> null, child: new Text("Growth", style: new TextStyle(
                color: Colors.redAccent, fontSize: 18.0, fontWeight: FontWeight.w600
            ),)),
            new ListTile(
                title: Image.asset("images/harvest.png",
                  width: 200.0,
                  height:200.0,
                  //fit: BoxFit.scaleDown,
                )),
            new FlatButton(onPressed :()=> null, child: new Text("Harvest", style: new TextStyle(
                color: Colors.redAccent, fontSize: 18.0, fontWeight: FontWeight.w600
            ),)),
          ],
        )

    ));
  }
}

