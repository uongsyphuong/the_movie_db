import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:the_movie_db/src/model/base_response.dart';
import 'package:the_movie_db/src/model/movie.dart';
import 'package:the_movie_db/src/resource/movie_detail.dart';

import 'item_movie.dart';

class ListMoviePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListMoviePage();
}

class _ListMoviePage extends State<ListMoviePage> {
  List<Movie> items;
  int page = 1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("The Movie DB"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: NotificationListener<ScrollNotification>(
                // ignore: missing_return
                onNotification: (ScrollNotification scrollInfo) {
                  if (!isLoading &&
                      scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                    _loadData(true);
                    setState(() {
                      isLoading = true;
                    });
                  }
                },
                child: RefreshIndicator(
                  onRefresh: () {
                    return _loadData(false);
                  },
                  child: ListView.builder(
                      itemCount: items != null ? items.length : 0,
                      itemBuilder: (context, index) {
                        if (items == null) return null;
                        return new ItemMovie(
                          movie: items[index],
                          onTap: () => onClickItemMovie(items[index]),
                        );
                      }),
                ),
              ),
            ),
            Container(
              height: isLoading ? 50 : 0,
              color: Colors.transparent,
              child: Container(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator()),
            )
          ],
        ));
  }

  void onClickItemMovie(Movie movie) {
    Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => MovieDetailPage(
                movieId: movie.id.toString(),
              )),
    );
  }

  Future _loadData(bool isInit) async {
    if (!isInit) {
      page = 1;
      items = null;
    }
    if (items != null) {
      page++;
    }

    var response = await http.get(Uri.https("api.themoviedb.org",
        "/3/movie/now_playing?api_key=bb65eb0482ae97c522075b1fadd87d61&page=$page"));
    if (response.statusCode == 200) {
      var listMovie =
          (BaseResponses.fromJson(jsonDecode(response.body)).results)
              .map((e) => Movie.fromJson(e))
              .toList();
      setState(() {
        if (items == null)
          items = listMovie;
        else {
          items.addAll(listMovie);
        }
        isLoading = false;
      });
    } else {
      print("Request failed with status: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData(true);
  }
}
