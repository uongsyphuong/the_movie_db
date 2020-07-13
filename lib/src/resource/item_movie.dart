import 'package:flutter/material.dart';
import 'package:the_movie_db/src/model/movie.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemMovie extends StatefulWidget {
  ItemMovie({Key key, this.movie, this.onTap}) : super(key: key);
  final Movie movie;
  VoidCallback onTap;

  @override
  State<StatefulWidget> createState() => _ItemMovie();
}

class _ItemMovie extends State<ItemMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/film_placeholder.png",
                  image: (widget.movie.getPostUrl()),
                  imageCacheWidth: (MediaQuery.of(context).size.width * 0.3).toInt(),
                  placeholderCacheWidth:
                      (MediaQuery.of(context).size.width * 0.3).toInt(),
                )),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.movie.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.clip,
                    ),
                    Container(
                        margin: EdgeInsetsDirectional.only(top: 4),
                        child: Text(
                          widget.movie.overview,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          textAlign: TextAlign.justify,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
