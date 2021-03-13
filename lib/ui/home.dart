

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Text(
            "Hello Rugano",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23.5,
                fontStyle: FontStyle.italic
            ),
          )),
      color: Colors.deepOrange,
    );
  }
}