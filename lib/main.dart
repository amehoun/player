import 'package:flutter/material.dart';
import 'package:player/screens/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'player',
      theme: ThemeData(),
      home: ListPage(),
    );
  }
}
