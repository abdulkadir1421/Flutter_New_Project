import 'package:flutter/material.dart';
import 'package:flutter_news/All_News.dart';
import 'package:flutter_news/Breaking_News.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        
        title: Text("Flutter News app"),
        bottom: TabBar(tabs: [
          Tab(text: "Breaking News"),
          Tab(text: "All News"),
        ]),
        
      ),
      body: TabBarView(children: [
        BreakingNewsUi(),
        AllNewsUi(),
      ]),
    ));
  }
}