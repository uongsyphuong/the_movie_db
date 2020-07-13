
class BaseResponses<T>{
  final List<T> results;
  final int page;

  BaseResponses(this.results, this.page);

  BaseResponses.fromJson(Map<String, dynamic> json)
      : results = json['results'],
        page = json['page'];

  Map<String, dynamic> toJson() =>
      {
        'results': results,
        'page': page,
      };
}