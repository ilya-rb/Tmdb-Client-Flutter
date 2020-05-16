import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

import 'package:tmdb_client_flutter/core/get_movie_by_type.dart';
import 'package:tmdb_client_flutter/home/now_playing_section.dart';
import 'package:tmdb_client_flutter/home/movie_section.dart';

@provide
class HomePage extends StatefulWidget {
  final GetHomeSections getHomeSections;

  HomePage(this.getHomeSections);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _createMoviesList();
  }

  Widget _createMoviesList() {
    return FutureBuilder<Iterable<MovieBlock>>(
      future: this.widget.getHomeSections.execute(),
      initialData: [],
      builder: (
        BuildContext context,
        AsyncSnapshot<Iterable<MovieBlock>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          final blocks = snapshot.data.toList();

          return ListView.builder(
              itemCount: blocks.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return NowPlayingSection(blocks[index].movies.toList());
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: MovieSection(
                    blocks[index].title,
                    blocks[index].movies.toList(),
                  ),
                );
              });
        }
        return Text("Unknown state");
      },
    );
  }
}
