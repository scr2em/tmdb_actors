import 'package:flutter/material.dart';
import 'package:iti_actors/ui/list_screen/ListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: ListScreen(),
      ),
    );
  }
}
