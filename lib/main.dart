import 'package:flutter/material.dart';

import 'package:first_flutter_app/ui/home.dart';

// void main() => runApp(ScaffoldExample());

void main() => runApp(new MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: QuizApp(),
    ));
