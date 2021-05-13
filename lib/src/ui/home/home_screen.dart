import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_movie_db/src/model/base_response.dart';
import 'package:the_movie_db/src/model/movie.dart';
import 'package:the_movie_db/src/ui/home/item_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> items;
  int page = 1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Text(
            "Thiết bị",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 12.0, top: 24.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.add, color: Color(0xFF019E84)),
              )),
          Padding(
              padding: EdgeInsets.only(right: 16.0, top: 24.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notifications_none,
                  color: Color(0xFF019E84),
                ),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_main.png"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
                      onTap: () => {},
                    );
                  }),
            ),
          ),
        ),
      ),
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

    var response = await http.get(Uri.https(
        "api.themoviedb.org",
        "/3/movie/now_playing",
        {"api_key": "bb65eb0482ae97c522075b1fadd87d61", "page": "$page"}));
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
    _loadData(true);
    super.initState();
  }
}
