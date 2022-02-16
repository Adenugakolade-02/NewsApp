import 'package:flutter/material.dart';
import 'package:newsapi_app/logic/api_manager.dart';
import 'package:newsapi_app/models/newsmodel.dart';
import 'package:newsapi_app/widgets/homebody.dart';
import 'package:newsapi_app/widgets/view_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<NewsModel>? newsModel;

  String? title;

  @override
  void initState() {
    // TODO: implement initState
    newsModel = ApiManager('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=efaf70469f0e409e90fc8596bc427b34').getNews();
    title = 'WallStreet';
;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(title!),
              actions: [
                PopupMenuButton<NewsClassApi>(
                  onSelected: (NewsClassApi selectedValue) {
                    setState(() {
                      if (selectedValue == NewsClassApi.WallStreet) {
                        newsModel = ApiManager('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=efaf70469f0e409e90fc8596bc427b34').getNews();
                        title = 'WallStreet';
                      } 
                      else if (selectedValue == NewsClassApi.Tesla) {
                        newsModel = ApiManager('https://newsapi.org/v2/everything?q=tesla&from=2022-01-14&sortBy=publishedAt&apiKey=efaf70469f0e409e90fc8596bc427b34').getNews();
                        title = 'Tesla';
                      } 
                      else if (selectedValue == NewsClassApi.Business) {
                        newsModel = ApiManager('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=efaf70469f0e409e90fc8596bc427b34').getNews();
                        title = 'Business';
                      } 
                      else {
                        newsModel = ApiManager('https://newsapi.org/v2/everything?q=apple&from=2022-02-13&to=2022-02-13&sortBy=popularity&apiKey=efaf70469f0e409e90fc8596bc427b34').getNews();
                        title = 'Apple';
                      }
                    });
                  },
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                        child: Text('WallStreet'),
                        value: NewsClassApi.WallStreet),
                    const PopupMenuItem(
                        child: Text('Tesla'), value: NewsClassApi.Tesla),
                    const PopupMenuItem(
                        child: Text('Business'), value: NewsClassApi.Business),
                    const PopupMenuItem(
                        child: Text('Apple'), value: NewsClassApi.Apple)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
                  ],
                )
              ],
            ),
            body: HomeBody(newsModel!)));
  }
}

enum NewsClassApi { WallStreet, Tesla, Business, Apple }
