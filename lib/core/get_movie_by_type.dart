import 'package:tmdb_client_flutter/core/repository/movie_repository.dart';
import 'package:inject/inject.dart';
import 'entity/movie.dart';
import 'movie_type.dart';

@provide
class GetHomeSections {
  final MovieRepository movieRepository;

  GetHomeSections(this.movieRepository);

  Future<Iterable<MovieBlock>> execute() async {
    final List<MovieBlock> sections = [];

    for (MovieType type in MovieType.values) {
      final results = await movieRepository.getMoviesByType(type);

      if (type == MovieType.NowPlaying) {
        sections.add(NowPlaying(type.code(), results.toList()));
      } else {
        sections.add(MovieList(type.code(), results.toList()));
      }
    }

    return sections;
  }
}

abstract class MovieBlock {
  final String title;
  final List<Movie> movies;
  MovieBlock(this.title, this.movies);
}

class NowPlaying extends MovieBlock {
  NowPlaying(String title, List<Movie> movies) : super(title, movies);
}

class MovieList extends MovieBlock {
  MovieList(String title, List<Movie> movies) : super(title, movies);
}
