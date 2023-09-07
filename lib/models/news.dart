



class NewsModel {


  final String title;
  final String url;
  final int score;
  List<int> kids;


  NewsModel({required this.title, required this.url, required this.kids, required this.score});

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
        title: json['title'] ?? '',
        url: json['url']?? '',
        score: json['score'] ?? 0,
        kids: json['kids'].cast<int>() ?? [],

    );
  }

}