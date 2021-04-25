import 'package:flutter/material.dart';
import 'package:iti_actors/ui/list_screen/ListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Actors demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Actors List"),
        ),
        body: ListScreen(),
      ),
    );
  }
}
