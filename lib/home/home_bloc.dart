import 'package:inject/inject.dart';
import 'package:tmdb_client_flutter/core/get_movie_by_type.dart';
import 'package:tmdb_client_flutter/core/get_trending.dart';

@provide
class HomeBloc {
  final GetHomeSections getHomeSections;
  final GetTrending getTrending;

  HomeBloc(this.getHomeSections, this.getTrending);

  Stream<Iterable<MovieBlock>> homeSections() async* {
    final homeSections = await getHomeSections.execute();
    yield homeSections;
    final trending = await getTrending.execute();

    if (homeSections.length >= 1) {
      yield homeSections.toList()..insert(1, trending);
    } else {
      yield homeSections.toList()..add(trending);
    }
  }
}
