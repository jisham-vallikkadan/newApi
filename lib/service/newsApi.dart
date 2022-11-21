import 'dart:convert';

import 'package:apifirstdemo/articlesmodelcalss.dart';
import 'package:http/http.dart' as http;

class NewsApi
{
  // String? country='us';
  //     String? category='health';
  Future<List<Newscad>> getNews(String country,String category) async
  {
    final url ="https://newsapi.org/v2/top-headlines?country=${country}&category=${category}&apiKey=50b2fc7e78a245b98701442b0309368c";
    // var response = await http.get(Uri.parse(url));
    var response = await http.post(Uri.parse(url),body: {'country': country,"category":category} );
    if(response.statusCode ==200)
      {
        var body = json.decode(response.body);

        List<Newscad> listData = List<Newscad>.from(body['articles'].map((v)=> Newscad.fromJson(v))).toList();

        return listData;
      }
    else
      {
        List<Newscad>listData = [];
        return listData;
      }


  }
}