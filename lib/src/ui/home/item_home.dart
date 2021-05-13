import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/src/model/movie.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: widget.onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                          text: TextSpan(children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Image.asset("assets/dot_connect.png"),
                          ),
                        ),
                        TextSpan(
                          text: "Đang kết nối".toUpperCase(),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9e9e9e)),
                        ),
                      ])),
                      Text(
                        "Vườn sân sau",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/ic_status.png",
                    height: 78,
                    width: 78,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
