class TodoModel {
  final String? uid;
  final String owner;
  final String content;
  final String createdAt;
  final bool isFInished;

  TodoModel({
    this.uid,
    required this.owner,
    required this.content,
    required this.createdAt,
    required this.isFInished,
  });

  factory TodoModel.fromjson(Map<String, dynamic> json) {
    return TodoModel(
      uid: json['uid'],
      owner: json['owner'],
      content: json['çontent'],
      createdAt: json['createdAt'],
      isFInished: json['isFinished'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "owner": owner,
        "content": content,
        "createdAt": createdAt,
        "isFinished": isFInished,
      };
}
