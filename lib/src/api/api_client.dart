import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_movie_db/src/model/base_response.dart';
import 'package:the_movie_db/src/model/movie.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://api.themoviedb.org")
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    return _ApiClient(dio);
  }

  @GET("/3/movie/now_playing")
  Future<BaseResponses<Movie>> getNowPlaying(@Query("api_key") String apiKey, @Query("page") int page);
}
