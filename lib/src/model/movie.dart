
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  int id;
  String title;
  String overview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;

  Movie(this.id, this.title, this.overview, this.posterPath, this.backdropPath);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  String getPostUrl(){
    return "http://image.tmdb.org/t/p/w200/$posterPath";
  }

  String getBackdropUrl() {
    return "http://image.tmdb.org/t/p/w400/$backdropPath";
  }
}