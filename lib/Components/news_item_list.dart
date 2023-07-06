import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/Models/News_Models.dart';
import 'package:flutter_news/News_Details.dart';





class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;
  const NewsItemList({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
           MaterialPageRoute(
          builder: (context) => NewsDetails(
            newsModel: newsModel)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:8),
        margin: EdgeInsets.symmetric(horizontal:12),
        child: Column(
         
          children: [
    
    CachedNetworkImage(
      height: 250,
      width: double.infinity,
      fit: BoxFit.fitWidth,
          imageUrl: newsModel.urlToImage.toString(),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
       ),
       Row(
         children: [SizedBox(width: 50,),
           Text(newsModel.source!.name.toString()),
           SizedBox(width: 100,),
           Text(newsModel.publishedAt.toString()),
         ],
       ),
        
           Row(
             children: [
               Text("Written by :"+" "+newsModel.author.toString()),
             ],
           ),
           SizedBox(height: 10,),
           Text(newsModel.title.toString()),
       
    
          ],
        ),
      ),
    );
  }
}