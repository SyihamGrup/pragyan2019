import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Fertilizers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => new WebviewScaffold(
          url: "https://www.bigbasket.com/pc/kitchen-garden-pets/gardening/fertilizers-pesticides/#!page=1",
          appBar: new AppBar(
            title: new Text("Purchase Fertilizer"),
            backgroundColor: Colors.green,
          ),

        ),
      },
    );
  }
}
