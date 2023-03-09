import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/views/brief_list.dart';



void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BriefList(),
    );
  }
}
