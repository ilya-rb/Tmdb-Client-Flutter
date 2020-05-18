import 'dart:async';

import 'package:flutter/material.dart';

import 'package:tmdb_client_flutter/core/entity/movie.dart';
import 'package:tmdb_client_flutter/localization/localization.dart';
import 'package:tmdb_client_flutter/util/util.dart';

class NowPlayingSection extends StatefulWidget {
  final List<Movie> movies;

  NowPlayingSection(this.movies, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NowPlayingSectionState();
  }
}

class _NowPlayingSectionState extends State<NowPlayingSection> {
  final pageController = PageController(initialPage: 0);

  Timer pagesTimer;

  @override
  void initState() {
    super.initState();

    pagesTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (pageController.page.toInt() == widget.movies.length - 1) {
        pageController.jumpToPage(0);
      } else {
        pageController.nextPage(
          duration: Duration(seconds: 1),
          curve: Curves.easeInToLinear,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: widget.movies.map((e) => _createPageItem(e)).toList()),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    pagesTimer.cancel();
    super.dispose();
  }

  Widget _createPageItem(Movie movie) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          createImageUrl(movie.posterPath),
          fit: BoxFit.cover,
        ),
        Container(color: Colors.black.withOpacity(0.3)),
        Container(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  AppLocalizations.of(context).nowPlaying,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
