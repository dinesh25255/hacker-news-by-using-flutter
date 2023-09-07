



import 'package:dio/dio.dart';
import 'package:hacker_news/api_exceptions.dart';
import 'package:hacker_news/models/news.dart';

class NewsService {


  static Future<List<int>> getTopIds() async {


    try{

      final dio = Dio();
      final response = await dio.get("https://hacker-news.firebaseio.com/v0/topstories.json");
      final data = response.data as List;
      return data.cast<int>();

    }

    on DioException catch (err){
      throw DioExceptions.getDioError(err);
    }


  }


  static Future<NewsModel> getTopStories (int id) async{

    try{


      final dio = Dio();

      final response = await dio.get("https://hacker-news.firebaseio.com/v0/item/$id.json");
      final data = response.data;
      final newsData = NewsModel.fromJson(data);
      return newsData;

    }

    on DioException catch(err){
      throw DioExceptions.getDioError(err);

    }

  }

}