import 'package:flutter/material.dart';
import 'package:weather/json.dart';
 class CropRotation extends StatefulWidget {
   @override
   _CropRotationState createState() => _CropRotationState();
 }

 class _CropRotationState extends State<CropRotation> {


   @override
   Widget build(BuildContext context) {


     ///////////////////////+++++++++++++++++++++++++++++++++++++++++++++++++++++++

     var _reminder=new TextEditingController();

     void checkCompatibility()
     {
       String reasons="";int count=0;int flag=0;
       Json ob=new Json();
     Map <dynamic,dynamic> data= ob.getJson2();
       if(_reminder.text.toLowerCase()=="rice")
         {
          int l=data["test"]["rice"].length;
          for(int i =0;i<l;i++)
            {
              if(data["test"]["rice"][i]["temp"]["min"]<22)
                count++;
              if(count>3)
              {flag=1;
               reasons+="Unfavorable minimum temperature. " ;
               break;
              }

            }
            count=0;
          for(int i =0;i<l;i++)
          {
            if(data["test"]["rice"][i]["temp"]["max"]>38)
              count++;
            if(count>3)
            {flag=1;
              reasons+="Unfavorable maximum temperature. " ;
              break;
            }
            count=0;
            for(int i =0;i<l;i++)
            {
              if(data["test"]["rice"][i]["rain"]<80)
                count++;
              if(count>3)
              {flag=1;
                reasons+="Unfavorable rain. " ;
                break;
              }

            }
          }
          if (flag==0)
            reasons="Crop growth is suitable";
          print(reasons);
          var alert= new AlertDialog(
            title: Text("Crop Sustainblity"),
            content: Text("$reasons"),
            actions: <Widget>[
              FlatButton(
                child: new Text("ok"),
                onPressed: ()=>Navigator.pop(context),
              )
            ],
          );
          showDialog(context: context,builder: (context)=>alert);
          _reminder.clear();
         }

         reasons="";


       if(_reminder.text.toLowerCase()=="wheat")
       {
         int l=data["test"]["wheat"].length;
         for(int i =0;i<l;i++)
         {
           if(data["test"]["wheat"][i]["temp"]["min"]<=12)
             count++;
           if(count>3)
           {flag=1;
           reasons+="Unfavorable minimum temperature. " ;
           break;
           }

         }
         count=0;
         for(int i =0;i<l;i++)
         {
           if(data["test"]["wheat"][i]["temp"]["max"]>26)
             count++;
           if(count>3)
           {flag=1;
           reasons+="Unfavorable maximum temperature. " ;
           break;
           }
           count=0;
           for(int i =0;i<l;i++)
           {
             if(data["test"]["wheat"][i]["rain"]<50)
               count++;
             if(count>3)
             {flag=1;
             reasons+="Unfavorable rain. " ;
             break;
             }

           }
         }
         if (flag==0)
           reasons="Crop growth is suitable";
         print(reasons);
         var alert= new AlertDialog(
           title: Text("Crop Sustainblity"),
           content: Text("$reasons"),
           actions: <Widget>[
             FlatButton(
               child: new Text("ok"),
               onPressed: ()=>Navigator.pop(context),
             )
           ],
         );
         showDialog(context: context,builder: (context)=>alert);
         _reminder.clear();
       }
     }
     /////////-----------------------------------------------------------------

     return (new Scaffold(
         appBar: new AppBar(
           title: new Text("Crop Rotation"),
           backgroundColor: Colors.redAccent,
         ),
         body: new ListView(
           children: <Widget>[
             new Padding(padding: EdgeInsets.all(15.0)),
             new ListTile(
                 title: Image.asset("images/growth.png",
                   width: 140.0,
                   height:140.0,

                   //fit: BoxFit.scaleDown,
                 )),
             new Padding(padding: EdgeInsets.all(15.0)),
             TextField(
               decoration: new InputDecoration(
                 labelText: "Enter Crop Name",
                 labelStyle: new TextStyle(color: Colors.black, fontSize: 21.0, fontStyle: FontStyle.normal),
                 hintText: "Eg Rice , wheat .. ",
                 fillColor:  Colors.amberAccent,
               ),
               style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300, fontSize: 15.0),
               controller: _reminder,

             ),
             new FlatButton(onPressed :()=> checkCompatibility(), child: new Text("Search Crop", style: new TextStyle(
                 color: Colors.redAccent, fontSize: 18.0, fontWeight: FontWeight.w600
             ),))
           ],
         )
     )
     );

   }
 }
