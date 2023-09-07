



class CommentModel {


  final String by;
  final String text;


  CommentModel({required this.by, required this.text});

  factory CommentModel.fromJson(Map<String, dynamic> json){
    return CommentModel(
        by: json['by'] ?? '',
        text: json['text'] ?? '',
    );


  }





}