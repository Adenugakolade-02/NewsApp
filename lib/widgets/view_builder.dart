import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewBuilder extends StatelessWidget {
  final String image;
  final String title;
  final String info;
  final String url;

  const ViewBuilder({Key? key, required this.image,required this.title, required this.info, required this.url}) : super(key: key);

  
  // Lauches the news article url from the newsApi
  void _launchUrl(String url) async {
    launch(url);
    // if(await canLaunch(url)){
    //   launch(url);
    // }
    // else{
    //   throw "Could not launch $url";
    // }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: (){
            _launchUrl(url);
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            elevation: 5,
            child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Row(
            children: [
              Container(
                  height: 100,
                  width : 100,
                  child: Image.network(image, fit: BoxFit.fill,),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20)
                  // ),
                ),
              const SizedBox(width: 5),
              Flexible(
                   child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    Text(
                      info,
                      overflow: TextOverflow.fade,
                      maxLines: 3,
                      style: const TextStyle(fontSize: 15)
                      )
                  ]
                ),
              )
            ],
            ),
        ),
          ),
    );
  }
}