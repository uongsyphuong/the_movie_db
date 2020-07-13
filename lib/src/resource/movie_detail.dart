import 'package:flutter/material.dart';
import 'package:the_movie_db/src/model/movie.dart';

import 'item_movie.dart';

class MovieDetailPage extends StatefulWidget {
  final String movieId;

  MovieDetailPage({Key key, @required this.movieId}): super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieDetailPage();
}

class _MovieDetailPage extends State<MovieDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("The Movie DB"),
        ),
        body: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network('https://picsum.photos/250?image=9'),
            )
          ],
        )
    );
  }

}