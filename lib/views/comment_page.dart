


import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/models/news.dart';
import 'package:hacker_news/services/comment_service.dart';
import 'package:hacker_news/widgets/shimmer.dart';

class CommentPage extends ConsumerWidget {

  NewsModel news;

  CommentPage(this.news);

  @override
  Widget build(BuildContext context, ref) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Comments"),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(

            children:     news.kids.map((e) {
              final commentData = ref.watch(commentProvider(e));
              return commentData.when(
                  data: (data){
                    return Column(
                      children: [
                        ListTile(
                          title: Html(data: data.text,),


                          subtitle: Text(data.by, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),

                        ),
                        Divider(color: Colors.grey,)
                      ],
                    );
                  },
                  error: (err, stack) => Text(err.toString()),
                  loading: () => Loading()
              );

            }).toList(),

          ),
        ),
      ),
    );



  }
}
