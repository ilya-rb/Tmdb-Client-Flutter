import 'package:inject/inject.dart';
import 'core/get_movie_by_type.dart';
import 'app.dart';
import 'home/home_page.dart';
import 'app_injector.inject.dart' as g;

@Injector()
abstract class AppInjector {
  @provide
  App get app;

  @provide
  GetHomeSections get getHomeSections;

  @provide
  HomePage get homePage;

  static Future<AppInjector> create() {
    return g.AppInjector$Injector.create();
  }
}
