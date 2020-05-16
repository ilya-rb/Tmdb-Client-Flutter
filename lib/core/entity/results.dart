import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'results.g.dart';

@immutable
@JsonSerializable()
class Results {
  @JsonKey(name: "results")
  final List<dynamic> results;

  @JsonKey(name: "page")
  final int page;

  @JsonKey(name: "total_pages")
  final int totalPages;

  Results(this.results, this.page, this.totalPages);

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Results &&
          runtimeType == other.runtimeType &&
          results == other.results &&
          page == other.page &&
          totalPages == other.totalPages;

  @override
  int get hashCode => results.hashCode ^ page.hashCode ^ totalPages.hashCode;
}
