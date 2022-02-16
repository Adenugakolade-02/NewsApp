import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapi_app/constants/url.dart';
import 'package:newsapi_app/models/newsmodel.dart';
// import 'package:built_value/json_object.dart';
import '';

class ApiManager{
  String url;
  ApiManager(this.url);



  Future<NewsModel> getNews() async {
    Uri uri = Uri.parse(url);
    var client = http.Client();
    // var newsModel = null;
    NewsModel? newsModel;
    var response = await client.get(uri);
    print(response.statusCode);

    try{
      if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      newsModel = NewsModel.fromJson(jsonMap);
      print('done');
    }
    else{
      print('nope');
    }
    }
    catch(e){
      print(e);
    }
    return newsModel!;
  }
}