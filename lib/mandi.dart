import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Mandi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => new WebviewScaffold(
          url: "http://www.agmarknet.gov.in",
          appBar: new AppBar(
            title: new Text("Gov Mandi Rate"),
            backgroundColor: Colors.green,
          ),

        ),
      },
    );
  }
}
