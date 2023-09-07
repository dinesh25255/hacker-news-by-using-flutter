import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/providers/news_provider.dart';
import 'package:hacker_news/views/comment_page.dart';
import 'package:hacker_news/views/detail_page.dart';
import 'package:hacker_news/widgets/shimmer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
   NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Trending Stories"),
          elevation: 0,
        ),
          body: Consumer(builder: (context, ref, child) {
          final idData = ref.watch(idProvider);
           return idData.when(
             data: (data) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: data.map((e){
                      final newsData = ref.watch(newsProvider(e));
                      return newsData.when(
                          data: (data){
                            return Column(
                              children: [
                                ListTile(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext bc){
                                          return Container(
                                            color: Colors.grey[350],
                                            child: Wrap(
                                              children: [
                                                ListTile(
                                                    leading: const Icon(Icons.newspaper),
                                                    title: const Text('story'),
                                                    onTap: () async {
                                                      Navigator.of(context).pop();
                                                      final Uri url = Uri.parse(data.url);
                                                      if (await canLaunchUrl(url)) {
                                                      await launchUrl(url, mode: LaunchMode.externalApplication);
                                                      } else {
                                                      throw "Could not launch $url";
                                                      }

                                                    }
                                                ),
                                                ListTile(
                                                    leading: const Icon(Icons.comment),
                                                    title: const Text('comments'),
                                                    onTap: () {
                                                      Navigator.of(context).pop();
                                                      Get.to(()=>CommentPage(data));



                                                    }
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                    );

                                  },
                                  title: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(data.title),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Icon(Icons.star),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6),
                                        child: Text(data.score.toString()),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(color: Colors.grey,)
                              ],
                            );
                          },
                          error: (err, stack) => Container(),
                          loading: () => Loading()
                      );

                    }).toList(),
                  );










                },
              );
            },
            error: (err, stack) => Center(child: Text(err.toString())),
            loading: () => const Center(child: CircularProgressIndicator(color: Colors.grey,))
        );







      },
      ),
      ),
    );
  }
}
