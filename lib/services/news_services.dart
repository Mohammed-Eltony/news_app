import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';
class NewsServices{


 Future<List<NewsModel>> getNews({required nameNews})async{
   String baseUrl = 'https://gnews.io/api/v4';
   String kay = 'd53c9f77518b252690b2759d8f5b42cd';

    Uri uri = Uri.parse('$baseUrl/search?q=$nameNews&lang=ar&country=eg&max=10&apikey=$kay');
    http.Response response= await http.get(uri);
    Map<String , dynamic> jsonData =jsonDecode(response.body);

    List<NewsModel> newsModel = NewsModel.fromNews(jsonData);
    // newsModel.forEach((element) {print(element);});
    return newsModel;
  }


}