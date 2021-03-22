import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_movie_db/src/model/base_response.dart';
import 'package:the_movie_db/src/model/movie.dart';
import 'package:the_movie_db/src/model/video.dart';
import 'package:video_player/video_player.dart';

import 'item_movie.dart';

class MovieDetailPage extends StatefulWidget {
  final String movieId;

  MovieDetailPage({Key key, @required this.movieId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieDetailPage();
}

class _MovieDetailPage extends State<MovieDetailPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    _loadData(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Movie DB"),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          child: (_controller != null)
          ? VideoPlayer(
            _controller,
          ): Container()
        ),
      ),
    );
  }

  Future _loadData(String movieId) async {
    var url =
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=bb65eb0482ae97c522075b1fadd87d61";
    var response = await http.get(Uri(scheme: url));
    if (response.statusCode == 200) {
      var listVideo = BaseResponses.fromJson(jsonDecode(response.body))
          .results
          .map((e) => Video.fromJson(e))
          .toList();
      var url;
      for (var element in listVideo) {
        if (element.type.contains("Trailer")) {
          url = element.getLinkUrl();
          break;
        }
      }
      setState(() {
        _controller = VideoPlayerController.network(url)
        ..addListener(() {

        })..setLooping(true)
        ..initialize()
        ..play();
      });
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }
}
