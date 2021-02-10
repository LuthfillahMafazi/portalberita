import 'package:flutter/material.dart';
import 'package:flutter_portalberita/models/category.dart';
import 'package:flutter_portalberita/models/news_respon.dart';

import '../views/category_item.dart';
import '../views/news_item.dart';

// ignore: must_be_immutable
class NewsPage extends StatelessWidget {
  NewsRespon responseBerita;
  List<Category> categories;

  NewsPage(this.responseBerita, this.categories);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      imageAssetUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName,
                    );
                  }),
            ),
            Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: responseBerita.articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsItem(
                        imgUrl: responseBerita.articles[index].urlToImage ?? "",
                        title: responseBerita.articles[index].title ?? "",
                        desc: responseBerita.articles[index].description ?? "",
                        content: responseBerita.articles[index].content ?? "",
                        posturl: responseBerita.articles[index].url ?? "",
                        name: responseBerita.articles[index].source.name ?? "",
                      );
                    })),
          ],
        ),
      ),
    );
  }
}