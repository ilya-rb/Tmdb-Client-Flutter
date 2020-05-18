import 'package:inject/inject.dart';

import 'package:tmdb_client_flutter/core/get_movie_by_type.dart';
import 'package:tmdb_client_flutter/app.dart';
import 'package:tmdb_client_flutter/core/get_trending.dart';
import 'package:tmdb_client_flutter/home/home_bloc.dart';
import 'package:tmdb_client_flutter/home/home_page.dart';
import 'package:tmdb_client_flutter/localization/localization.dart';
import 'package:tmdb_client_flutter/app_injector.inject.dart' as g;

@Injector()
abstract class AppInjector {
  @provide
  App get app;

  @provide
  GetHomeSections get getHomeSections;

  @provide
  GetTrending get getTrending;

  @provide
  HomeBloc get homeBloc;

  @provide
  HomePage get homePage;

  @provide
  AppLocalizationsDelegate get appLocalizationsDelegate;

  static Future<AppInjector> create() {
    return g.AppInjector$Injector.create();
  }
}
