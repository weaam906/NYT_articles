import 'package:flutter/material.dart';
import 'articlesList.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
//This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NYT BEST STORIES',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: articlesList(),
    );
  }
}


