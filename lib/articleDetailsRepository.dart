import 'dart:async';
import 'package:dio/dio.dart';
import 'package:nyt_best_stories_task/articleClass.dart';
import 'articleDetails.dart';



class articleDetailsRepository {

  articleDetailsRepository();
  final _apiKey = "3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9";
  final Dio dio = Dio();

  Future<articleClass> getArticleDetails(int id) {
    print("repository :$id");
    return  dio.get("https://api.nytimes.com/svc/topstories/${id.toString()}", queryParameters: {
      "api_key": _apiKey,
    }).then((d) {
      print(d.data);
      return articleClass().fromJSON(d.data);
    });
  }
}