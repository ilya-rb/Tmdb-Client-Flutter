import 'package:json_annotation/json_annotation.dart';

import 'package:meta/meta.dart';

import 'package:tmdb_client_flutter/core/entity/genre.dart';

part 'movie.g.dart';

@immutable
@JsonSerializable()
class Movie {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "release_date")
  final String releaseDate;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "genres")
  final List<Genre> genres;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  Movie(this.id, this.title, this.releaseDate, this.voteAverage,
      this.posterPath, this.genres);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          releaseDate == other.releaseDate &&
          voteAverage == other.voteAverage &&
          posterPath == other.posterPath;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      releaseDate.hashCode ^
      voteAverage.hashCode ^
      posterPath.hashCode;
}
