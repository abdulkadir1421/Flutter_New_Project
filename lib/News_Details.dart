import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/Models/News_Models.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {

  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text(widget.newsModel.title.toString()),
      ),
      body: Padding(
        padding: EdgeInsets.all(9),
        child: Column(
          children: [
             CachedNetworkImage(
        height: 250,
        width: double.infinity,
        fit: BoxFit.fitWidth,
            imageUrl: widget.newsModel.urlToImage.toString(),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
         ),
      
          Row(
           children: [SizedBox(width: 50,),
             Text(widget.newsModel.source!.name.toString()),
             SizedBox(width: 100,),
             Text(widget.newsModel.publishedAt.toString()),
           ],
         ),
          
             Row(
               children: [
                 Text("Written by :"+" "+widget.newsModel.author.toString()),
               ],
             ),
      
             SizedBox(height: 10,),
             Text(widget.newsModel.title.toString()),
               SizedBox(height: 10,),
             Text(widget.newsModel.description.toString()),

             SizedBox(height: 10,),
             ElevatedButton(onPressed: ()async{
              final Uri uri= Uri.parse(widget.newsModel.url.toString());
              if(await launchUrl(uri)){
                throw Exception("Failled to launched");
              }
             },
              child: Text("Read more..."))
          ],
        ),
      ),
      );
  }
}