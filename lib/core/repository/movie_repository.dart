import 'package:dio/dio.dart';

import 'package:inject/inject.dart';

import 'package:tmdb_client_flutter/core/entity/movie.dart';
import 'package:tmdb_client_flutter/core/movie_type.dart';
import 'package:tmdb_client_flutter/core/entity/results.dart';
import 'package:tmdb_client_flutter/keys.dart';

@provide
@singleton
class MovieRepository {
  static const String _MOVIE_API_BASE_URL = "https://api.themoviedb.org/3/";
  static const String _ENDPOINT_MOVIE = "movie/";
  static const String _ENDPOINT_TRENDING = "trending/movie/week";

  final Dio dio = Dio()
    ..options.connectTimeout = 10000 // 10 seconds
    ..options.receiveTimeout = 3000 // 3 seconds
    ..options.baseUrl = _MOVIE_API_BASE_URL
    ..interceptors.add(LogInterceptor(responseBody: true))
    ..options.queryParameters = {"api_key": API_KEY};

  Future<Iterable<Movie>> getMoviesByType(MovieType type) async {
    final response = await dio.request(
      "$_ENDPOINT_MOVIE/${type.code()}",
      options: Options(method: "GET"),
    );
    final results = Results.fromJson(response.data);
    final moviesList = results.results.map((e) => Movie.fromJson(e));
    return moviesList;
  }

  Future<Iterable<Movie>> getTrending() async {
    final response = await dio.request(
      _ENDPOINT_TRENDING,
      options: Options(method: "GET"),
    );
    final results = Results.fromJson(response.data);
    final moviesList = results.results.map((e) => Movie.fromJson(e));
    return moviesList;
  }
}
