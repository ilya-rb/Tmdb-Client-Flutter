import 'package:flutter/material.dart';

import 'package:tmdb_client_flutter/core/entity/movie.dart';
import 'package:tmdb_client_flutter/localization/localization.dart';
import 'package:tmdb_client_flutter/util/util.dart';

class TrendingSection extends StatefulWidget {
  final List<Movie> movies;

  TrendingSection(this.movies);

  @override
  _TrendingSectionState createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8.0),
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
            child: Text(
              AppLocalizations.of(context).trending,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
            height: 80.0,
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
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).accentColor, width: 2.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(createImageUrl(movie.posterPath)),
        ),
      ),
    );
  }
}
