class Question {
  String title;
  String info;

  Question({this.title, this.info});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        title: json['title'].toString(), info: json['info'].toString());
  }
}
