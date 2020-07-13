import 'package:http/http.dart';

_makeGetRequest() async {
  var url = "https://jsonplaceholder.typicode.com/posts";
  var response = await get(url);
  var statusCode = response.statusCode;
  var header = response.headers;
  var contentType = header['content-type'];
  var json = response.body;

}