import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

import 'package:tmdb_client_flutter/home/home_page.dart';
import 'package:tmdb_client_flutter/types.dart';

@provide
class App extends StatelessWidget {
  final Provider<HomePage> homePage;

  App(this.homePage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB Client',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.purple[800],
          accentColor: Colors.amber,
          accentColorBrightness: Brightness.dark,
          textTheme: TextTheme(
            headline6: TextStyle(fontSize: 36.0, color: Colors.white),
            headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
          )),
      home: Scaffold(body: homePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
