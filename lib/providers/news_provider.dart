



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/services/news_service.dart';

final newsProvider = FutureProvider.family((ref, int id) => NewsService.getTopStories(id));


final idProvider = FutureProvider((ref) => NewsService.getTopIds());