import "package:flutter/material.dart";
import 'package:weather/home.dart';
import 'package:firebase_database/firebase_database.dart';
void main()
{
  runApp(
      new MaterialApp(
        title: "Agritech",
        home: home(),
        debugShowCheckedModeBanner: false,

      )
  );
}