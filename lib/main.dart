import 'package:fifteen/screens/high_scores.dart';
import 'package:fifteen/screens/main_screen.dart';
import 'package:fifteen/screens/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: "Fifteen",
  initialRoute: "/",
  routes: {
    "/": (context) => Fifteen(),
    "/settings": (context) => Settings(),
    "/high_scores": (context) => HighScores()
  },
  theme: ThemeData(
    primaryColor: Colors.green,
  ),
));
