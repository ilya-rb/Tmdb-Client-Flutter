import 'package:flutter/material.dart';

import 'package:tmdb_client_flutter/core/entity/movie.dart';
import 'package:tmdb_client_flutter/util/util.dart';

class MovieSection extends StatefulWidget {
  final List<Movie> movies;
  final String title;

  MovieSection(this.title, this.movies, {Key key}) : super(key: key);

  @override
  _MovieSectionState createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
            height: 200.0,
            margin: const EdgeInsets.all(16.0),
            child: ListView.separated(
              itemCount: widget.movies.length,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (BuildContext conext, int index) =>
                  SizedBox(width: 16.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _createListItem(widget.movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _createListItem(Movie movie) {
    return Container(
      width: 120,
      height: 200.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(4.0),
            child: Ink.image(
              image: NetworkImage(createImageUrl(movie.posterPath)),
              height: 200.0,
              fit: BoxFit.cover,
              width: 120.0,
              child: InkWell(
                onTap: () {},
              ),
            ),
          ),
          // Text(
          //   movie.title,
          //   style: Theme.of(context).textTheme.bodyText2,
          // )
        ],
      ),
    );
  }
}
