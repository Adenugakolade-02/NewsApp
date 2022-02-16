import 'package:flutter/material.dart';
import 'package:newsapi_app/models/newsmodel.dart';
import 'package:newsapi_app/widgets/view_builder.dart';

class HomeBody extends StatelessWidget {
  Future<NewsModel> newsModel;
  HomeBody(this.newsModel);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsModel>(
            future: newsModel,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                itemCount: snapshot.data!.articles.length,
                itemBuilder: (context,index){
                  var article = snapshot.data!.articles[index];
                  
                  return ViewBuilder(image: article.urlToImage,title: article.title,info: article.description,url: article.url);
                });
              }
              else{
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
    );
  }
}