import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

import 'package:tmdb_client_flutter/home/home_page.dart';
import 'package:tmdb_client_flutter/localization/localization.dart';
import 'package:tmdb_client_flutter/util/types.dart';
import 'package:tmdb_client_flutter/ui/theme.dart';

@provide
class App extends StatelessWidget {
  final Provider<HomePage> homePage;
  final Provider<AppLocalizationsDelegate> appLocalizations;

  App(this.homePage, this.appLocalizations);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TMDB",
      theme: themeData,
      home: Scaffold(body: homePage()),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [appLocalizations()],
      supportedLocales: AppLocalizationsDelegate.supportedLocalizations(),
    );
  }
}
