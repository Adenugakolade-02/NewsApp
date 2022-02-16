import 'package:newsapi_app/models/source.dart';

class Articles{
  Source source;
  dynamic author;
  dynamic title;
  dynamic description;
  dynamic url;
  dynamic urlToImage;
  dynamic publishedAt;
  dynamic content;

  Articles({required this.source, required this.author, required this.title, required this.description, required this.url, required this.urlToImage, required this.publishedAt, required this.content});

  factory Articles.fromJson(Map<String,dynamic> data) => Articles(
    source: Source.fromJson(data["source"]),
   
    author: data["author"] == null ? null : data["author"], 
    title: data["title"], 
    description: data["description"], 
    url: data["url"], 
    urlToImage: data["urlToImage"], 
    publishedAt: data["publishedAt"], 
    content: data["content"]);

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };
}