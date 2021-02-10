import 'package:flutter_portalberita/models/news_respon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String apiKey = "846208a48e754b088f85a85bc50d7381";

class News {
  Future<NewsRespon> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&excludeDomains=stackoverflow.com"
        "&sortBy=publishedAt&language=en&apiKey=$apiKey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}

class RequestByCategory {
  Future<NewsRespon> getNewsByCategory(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=id&category=$category&"
        "apiKey=$apiKey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return NewsRespon.fromJsonMap(jsonData);
  }
}