import 'package:flutter/material.dart';
import 'package:tmdb_client_flutter/app_injector.dart';

void main() async {
  final container = await AppInjector.create();
  runApp(container.app);
}
