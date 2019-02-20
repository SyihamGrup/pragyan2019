import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Blog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => new WebviewScaffold(
          url: "http://www.spadesx.weebly.com",
          appBar: new AppBar(
            title: new Text("Blog"),
            backgroundColor: Colors.orangeAccent,
          ),

        ),
      },
    );
  }
}
