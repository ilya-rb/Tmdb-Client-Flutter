import 'package:flutter/material.dart';
import 'package:tmdb_client_flutter/core/entity/movie.dart';
import 'package:tmdb_client_flutter/util.dart';

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
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                itemCount: widget.movies.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _createListItem(widget.movies[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createListItem(Movie movie) {
    return Container(
      width: 120,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          createImageUrl(movie.posterPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
