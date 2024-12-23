import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_nest/models/categories_new_model.dart';
import 'package:news_nest/models/news_channel_headlines_model.dart';

class NewsRepository {
  Future<CategoriesNewsModel> fetchNewsCategories(String category) async {
    String newsUrl =
        'https://newsapi.org/v2/everything?q=$category&apiKey=67b8cdc80e0d45a68590ee1488084c26';
    final response = await http.get(Uri.parse(newsUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return CategoriesNewsModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }

  Future<NewsChannelsHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String newsChannel) async {
    String newsUrl =
        'https://newsapi.org/v2/top-headlines?sources=${newsChannel}&apiKey=67b8cdc80e0d45a68590ee1488084c26';
    print(newsUrl);
    final response = await http.get(Uri.parse(newsUrl));
    print(response.statusCode.toString());
    print(response);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }
}
