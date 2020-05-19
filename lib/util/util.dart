// TODO: Remove this
import 'package:flutter/material.dart';

String createImageUrl(String path) {
  final buffer = StringBuffer("https://image.tmdb.org/t/p/w300/")..write(path);
  return buffer.toString();
}

EdgeInsets createDefaultHorizontalListPadding(int index, int size) {
  if (index == 0) {
    return const EdgeInsets.only(left: 16.0, right: 8.0);
  } else if (index == size - 1) {
    return const EdgeInsets.only(right: 16.0, left: 8.0);
  } else {
    return const EdgeInsets.symmetric(horizontal: 8.0);
  }
}
