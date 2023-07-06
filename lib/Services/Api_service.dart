import 'dart:convert';

import 'package:flutter_news/Models/News_Models.dart';
import 'package:http/http.dart';

class ApiService{
  final all_news_url ="https://newsapi.org/v2/everything?q=bitcoin&apiKey=22ff013ccade4190bb1b13456f222fee";
  final breaking_news_url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=22ff013ccade4190bb1b13456f222fee";

  Future<List<NewsModel>> getAllNews() async{
    try{
      Response response = await get(Uri.parse(all_news_url));

      if(response.statusCode == 200){

        Map<String,dynamic> json = jsonDecode(response.body);

        List<dynamic>body = json['articles'];

        List<NewsModel>articleslist = body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      }else{
        throw ("No data found");
      }

    }catch(e){
      throw e;
    }
  }

   Future<List<NewsModel>> getBreakingNews() async{
    try{
      Response response = await get(Uri.parse(breaking_news_url));

      if(response.statusCode == 200){

        Map<String,dynamic> json = jsonDecode(response.body);

        List<dynamic>body = json['articles'];

        List<NewsModel>articleslist = body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      }else{
        throw ("No data found");
      }

    }catch(e){
      print(e.toString());
      throw e;
    }
  }
}