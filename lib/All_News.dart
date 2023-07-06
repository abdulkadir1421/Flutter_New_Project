import 'package:flutter/material.dart';
import 'package:flutter_news/Components/news_item_list.dart';
import 'package:flutter_news/Models/News_Models.dart';
import 'package:flutter_news/Services/Api_service.dart';

class AllNewsUi extends StatefulWidget {
  const AllNewsUi({super.key});

  @override
  State<AllNewsUi> createState() => _AllNewsUiState();
}

class _AllNewsUiState extends State<AllNewsUi> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiService.getAllNews(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          List<NewsModel>articleslists = snapshot.data ?? [];
          return ListView.builder(
            itemBuilder: (context,index){
            return NewsItemList(newsModel: articleslists[index],);
          },
          itemCount: articleslists.length,
          );
        }
        return Center(child: CircularProgressIndicator(),
        );
      },),
    );
  }
}