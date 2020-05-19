import 'package:flutter/material.dart';

/// Returns application main theme
ThemeData get themeData => ThemeData(
      fontFamily: "Montserrat",
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme(
        primary: Colors.blue[500],
        primaryVariant: Colors.blue[800],
        secondary: Colors.deepOrange[500],
        secondaryVariant: Colors.deepOrange[800],
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red[500],
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.black,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        headline6: TextStyle(fontSize: 36.0, color: Colors.white),
        headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );
