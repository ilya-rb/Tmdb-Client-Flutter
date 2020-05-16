enum MovieType {
  NowPlaying,
  Upcoming,
  TopRated,
  Popular,
}

extension MovieTypeExtension on MovieType {
  String code() {
    switch (this) {
      case MovieType.NowPlaying:
        return "now_playing";
      case MovieType.Upcoming:
        return "upcoming";
      case MovieType.TopRated:
        return "top_rated";
      case MovieType.Popular:
        return "popular";
    }
    return "";
  }
}
