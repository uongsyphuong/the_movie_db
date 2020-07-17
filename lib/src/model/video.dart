
import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  String id;
  String key;
  String name;
  String type;

  Video(this.id, this.key, this.name, this.type);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  String getLinkUrl(){
    return "https://www.youtube.com/watch?v=$key";
  }

}