import 'package:inject/inject.dart';

import 'package:tmdb_client_flutter/core/get_movie_by_type.dart';
import 'package:tmdb_client_flutter/core/repository/movie_repository.dart';

@provide
class GetTrending {
  final MovieRepository movieRepository;

  GetTrending(this.movieRepository);

  Future<MovieBlock> execute() async {
    final movies = await movieRepository.getTrending();
    return TrendingList(movies.toList());
  }
}
