import 'package:flutter/material.dart';

import 'package:tmdb_client_flutter/core/entity/movie.dart';
import 'package:tmdb_client_flutter/localization/localization.dart';
import 'package:tmdb_client_flutter/util/util.dart';

class MovieSection extends StatefulWidget {
  final List<Movie> movies;
  final String title;

  MovieSection(this.title, this.movies, {Key key}) : super(key: key);

  @override
  _MovieSectionState createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  static const _ITEM_HEIGHT = 170.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: _createSectionHeader(widget.title),
          ),
          Container(
            height: _ITEM_HEIGHT,
            child: ListView.builder(
              itemCount: widget.movies.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: createDefaultHorizontalListPadding(
                    index,
                    widget.movies.length,
                  ),
                  child: _createListItem(widget.movies[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _createListItem(Movie movie) {
    return Container(
      height: _ITEM_HEIGHT,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          createImageUrl(movie.posterPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _createSectionHeader(String title) {
    return Row(
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.headline5),
        Spacer(),
        OutlineButton(
          onPressed: () {},
          child: Text(AppLocalizations.of(context).seeAll),
        )
      ],
    );
  }
}
