import 'package:flutter/material.dart';

import 'package:inject/inject.dart';

import 'package:tmdb_client_flutter/core/get_movie_by_type.dart';
import 'package:tmdb_client_flutter/core/movie_type.dart';
import 'package:tmdb_client_flutter/home/home_bloc.dart';
import 'package:tmdb_client_flutter/home/now_playing_section.dart';
import 'package:tmdb_client_flutter/home/movie_section.dart';
import 'package:tmdb_client_flutter/home/trending_section.dart';
import 'package:tmdb_client_flutter/localization/localization.dart';

@provide
class HomePage extends StatefulWidget {
  final HomeBloc homeBloc;

  HomePage(this.homeBloc);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _createMoviesList();
  }

  Widget _createMoviesList() {
    return StreamBuilder<Iterable<MovieBlock>>(
      stream: this.widget.homeBloc.homeSections(),
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
              if (blocks[index].runtimeType == NowPlaying) {
                return NowPlayingSection(blocks[index].movies.toList());
              } else if (blocks[index].runtimeType == TrendingList) {
                return TrendingSection(blocks[index].movies.toList());
              }
              return MovieSection(
                _sectionTitle(blocks[index].type),
                blocks[index].movies.toList(),
              );
            },
          );
        }
        return Text("Unknown state");
      },
    );
  }

  String _sectionTitle(MovieType movieType) {
    switch (movieType) {
      case MovieType.NowPlaying:
        return AppLocalizations.of(context).nowPlaying;
      case MovieType.Popular:
        return AppLocalizations.of(context).popular;
      case MovieType.TopRated:
        return AppLocalizations.of(context).topRated;
      default:
        return AppLocalizations.of(context).upcoming;
    }
  }
}
