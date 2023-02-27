import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home:  Scaffold(
      appBar: AppBar(
        title: Text('Simplonline',
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
        ),),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Briefs'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Text('click'),
        backgroundColor: Colors.red,
      ) ,
    ),
  ));
