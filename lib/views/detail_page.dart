


import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/models/news.dart';
import 'package:hacker_news/services/comment_service.dart';
import 'package:hacker_news/widgets/shimmer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends ConsumerWidget {

  NewsModel news;

  DetailPage(this.news);

  @override
  Widget build(BuildContext context, ref) {

    return SafeArea(
      child: Scaffold(
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          backgroundColor: Colors.grey[350],
          initialUrl: news.url,)
      ),
    );



  }
}
