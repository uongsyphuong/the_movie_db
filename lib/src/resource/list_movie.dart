import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http_logger/http_logger.dart';
import 'package:http_middleware/http_middleware.dart';
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
      MaterialPageRoute(builder: (context) => MovieDetailPage()),
    );

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("${movie.title}"),
        ],
      ),
    );

    FlutterToast(context).showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  Future _loadData(bool isInit) async {
    if (!isInit){
      page = 1;
      items = null;
    }
    if (items != null) {
      page++;
    }
    HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY)
    ]);
    var url =
        "http://api.themoviedb.org/3/movie/now_playing?api_key=bb65eb0482ae97c522075b1fadd87d61&page=$page";
    var response = await httpClient.get(url);
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
