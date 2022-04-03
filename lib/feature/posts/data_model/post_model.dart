import 'package:stacked_api_implementation/feature/user/data_model/user_model.dart';
///PostModel that references Api data
class PostModel {
  final int userId;
  final int postId;
  final String title;
  final String body;

  PostModel({
    required this.userId,
    required this.postId,
    required this.title,
    required this.body,
  });

  @override
  String toString() {
    return '''
      userId : $userId
      postId : $postId
      title: $title,
      body : $body,
      
      
    ''';
  }

  factory PostModel.fromMap(Map<String, dynamic> json) => _postFromMap(json);

  Map<String, dynamic> toMap() => _postToMap(this);
}

Map<String, dynamic> _postToMap(PostModel post) {
  return Map<String, dynamic>.from({
    'userId': post.userId,
    'id': post.postId,
    'title': post.title,
    'body': post.body,
  });
}

PostModel _postFromMap(Map<String, dynamic> json) {
  int userId = json['userId'] as int;
  int postId = json['id'] as int;
  String title = json['title'] as String;
  String body = json['body'] as String;

  return PostModel(
    userId: userId,
    postId: postId,
    title: title,
    body: body,
  );
}

///post model that references application data
class Post {
  final int postId;
  final User user;
  final String title;
  final String body;

  Post({
    required this.postId,
    required this.user,
    required this.title,
    required this.body,
  });
}
