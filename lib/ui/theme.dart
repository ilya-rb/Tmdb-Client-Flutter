import 'package:flutter/material.dart';

/// Returns application main theme
ThemeData get themeData => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Colors.purple[800],
      accentColor: Colors.amber,
      accentColorBrightness: Brightness.dark,
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 36.0, color: Colors.white),
        headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
