class Post {
  final int userId;
  final int postId;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.postId,
    required this.title,
    required this.body,
  });

  @override
  String toString(){
    return '''
      userId : $userId
      postId : $postId
      title: $title,
      body : $body,
      
      
    ''';
  }

  factory Post.fromMap(Map<String, dynamic> json) => _postFromMap(json);

  Map<String, dynamic> toMap() => _postToMap(this);
}

Map<String, dynamic> _postToMap(Post post) {
  return Map<String, dynamic>.from({
    'userId': post.userId,
    'id': post.postId,
    'title': post.title,
    'body': post.body,
  });
}

Post _postFromMap(Map<String, dynamic> json) {
  int userId = json['userId'] as int;
  int postId = json['id'] as int;
  String title = json['title'] as String;
  String body = json['body'] as String;

  return Post(
    userId: userId,
    postId: postId,
    title: title,
    body: body,
  );
}
