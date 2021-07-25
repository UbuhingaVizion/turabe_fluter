import 'package:flutter/material.dart';
import 'package:first_flutter_app/ui/home.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.grey[900],
      accentColor: Colors.grey.shade900,
      scaffoldBackgroundColor: Colors.grey.shade800,
      textTheme: _appTextTheme(base.textTheme));
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline1: base.headline1
              .copyWith(fontSize: 34.0, fontWeight: FontWeight.bold),
          headline6: base.headline6.copyWith(fontSize: 18.0),
          button: base.button.copyWith(letterSpacing: 3.0),
          caption: base.caption
              .copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
          bodyText2: base.bodyText1.copyWith(
              fontSize: 17.0, fontFamily: "Lobster", color: Colors.white))
      .apply(fontFamily: "Lobster");
}

void main() => runApp(new MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: MovieListView(),
    ));
