import 'package:inject/inject.dart';

import 'package:tmdb_client_flutter/core/repository/movie_repository.dart';
import 'package:tmdb_client_flutter/core/entity/movie.dart';
import 'package:tmdb_client_flutter/core/movie_type.dart';

@provide
class GetHomeSections {
  final MovieRepository movieRepository;

  GetHomeSections(this.movieRepository);

  Future<Iterable<MovieBlock>> execute() async {
    final List<MovieBlock> sections = [];

    for (MovieType type in MovieType.values) {
      final results = await movieRepository.getMoviesByType(type);

      if (type == MovieType.NowPlaying) {
        sections.add(NowPlaying(type, results.toList()));
      } else {
        sections.add(MovieList(type, results.toList()));
      }
    }

    return sections;
  }
}

abstract class MovieBlock {
  final MovieType type;
  final List<Movie> movies;
  MovieBlock(this.type, this.movies);
}

class NowPlaying extends MovieBlock {
  NowPlaying(MovieType type, List<Movie> movies) : super(type, movies);
}

class MovieList extends MovieBlock {
  MovieList(MovieType type, List<Movie> movies) : super(type, movies);
}

class TrendingList extends MovieBlock {
  TrendingList(List<Movie> movies) : super(null, movies);
}
