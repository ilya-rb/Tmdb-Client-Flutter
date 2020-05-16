import 'package:dio/dio.dart';
import 'package:inject/inject.dart';

import '../entity/movie.dart';
import '../movie_type.dart';
import '../entity/results.dart';

@provide
@singleton
class MovieRepository {
  static const String _MOVIE_API_BASE_URL = "https://api.themoviedb.org/3/";
  static const String _ENDPOINT_MOVIE = "movie/";
  static const String _API_KEY = "";

  final Dio dio = Dio()
    ..options.connectTimeout = 10000
    ..options.receiveTimeout = 3000
    ..options.baseUrl = _MOVIE_API_BASE_URL
    ..interceptors.add(LogInterceptor(responseBody: true))
    ..options.queryParameters = {"api_key": _API_KEY};

  Future<Iterable<Movie>> getMoviesByType(MovieType type) async {
    final code = type.code();
    final response = await dio.request("$_ENDPOINT_MOVIE/$code",
        options: Options(method: "GET"));
    final results = Results.fromJson(response.data);
    final moviesList = results.results.map((e) => Movie.fromJson(e));
    return moviesList;
  }
}
