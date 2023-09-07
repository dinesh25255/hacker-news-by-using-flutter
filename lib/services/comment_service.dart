




import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/api_exceptions.dart';
import 'package:hacker_news/models/comment.dart';


final commentProvider = FutureProvider.family((ref, int id) => getComment(id));

Future<CommentModel> getComment (int id) async{

try{

  final dio = Dio();
  final response = await dio.get("https://hacker-news.firebaseio.com/v0/item/$id.json");
  final data = response.data;
  final newsData = CommentModel.fromJson(data);
  return newsData;

}

on DioException catch(err){

  throw DioExceptions.getDioError(err);

}

}