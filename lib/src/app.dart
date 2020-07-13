import 'package:flutter/material.dart';
import 'package:the_movie_db/src/resource/list_movie.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie DB',
      theme: ThemeData(

        primarySwatch: Colors.grey,
      ),
      home: ListMoviePage(),
    );
  }
}
