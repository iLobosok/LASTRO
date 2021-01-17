import 'package:flutter/material.dart';
import 'package:flutter_universe/math.dart';
import 'package:flutter_universe/stars.dart';
import 'Second.dart';
import 'faq.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LASTRO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SecondActivity(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/main': (context) => HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => stars(),
        '/faq': (context) => faques(),
        '/math': (context) => math(),
      },
    );
  }
}