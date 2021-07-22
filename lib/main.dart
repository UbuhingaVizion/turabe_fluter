import 'package:flutter/material.dart';

import 'ui/home.dart';

// void main() => runApp(ScaffoldExample());

void main() => runApp(new MaterialApp(
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrange.shade300,
    textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      fontSize: 16.9,
      color: Colors.redAccent,
    ),
    ),
  ),
      home: MovieListView(),
    ));
