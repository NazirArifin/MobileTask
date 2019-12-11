import 'package:flutter/material.dart';
import 'package:newapp/screen/add.dart';
import 'package:newapp/screen/detail.dart';
import 'package:newapp/screen/list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(),
        '/add': (context) => AddScreen(),
        '/detail': (context) => DetailScreen()
      },
    );
  }
}