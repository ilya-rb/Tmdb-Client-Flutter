import 'package:meta/meta.dart';

import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@immutable
@JsonSerializable()
class Genre {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  Genre(this.id, this.name);

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Genre &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
