import 'package:flutter/material.dart';
import 'package:flutter_portalberita/models/category.dart';
import 'package:flutter_portalberita/repositories/data_category.dart';
import 'package:flutter_portalberita/repositories/data_request.dart';
import 'package:flutter_portalberita/ui/widgets/widgets.dart';

import 'news_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News news = News();

  List<Category> categories = List<Category>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(),
        body: SafeArea(
            child: FutureBuilder(
                future: news.getNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NewsPage(snapshot.data, categories);
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(child: Text("Data tidak tersedia"));
                  }

                  return Center(child: CircularProgressIndicator());
                })));
  }
}