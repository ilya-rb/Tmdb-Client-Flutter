// TODO: Remove this
String createImageUrl(String path) {
  final buffer = StringBuffer("https://image.tmdb.org/t/p/w300/")..write(path);
  return buffer.toString();
}
