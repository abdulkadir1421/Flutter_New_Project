import 'package:flutter/material.dart';
import 'package:flutter_news/Components/news_item_list.dart';
import 'package:flutter_news/Models/News_Models.dart';
import 'package:flutter_news/Services/Api_service.dart';

class BreakingNewsUi extends StatefulWidget {
  const BreakingNewsUi({super.key});

  @override
  State<BreakingNewsUi> createState() => _BreakingNewsUiState();
}

class _BreakingNewsUiState extends State<BreakingNewsUi> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: apiService.getBreakingNews(),
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