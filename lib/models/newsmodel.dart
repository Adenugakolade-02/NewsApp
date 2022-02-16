import 'package:newsapi_app/models/articles.dart';


class NewsModel{
  dynamic status;
  dynamic totalResults;
  List<Articles> articles;

  NewsModel({required this.status, required this.totalResults, required this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> data) => NewsModel(
        status: data["status"],
        totalResults: data["totalResults"],
        articles: List<Articles>.from(data["articles"].map((x) => Articles.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };


}