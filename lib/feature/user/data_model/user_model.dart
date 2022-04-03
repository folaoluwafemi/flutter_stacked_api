class User {
  final int userId;
  final String name;
  final String username;
  final UserImage avatar;

  User({
    required this.userId,
    required this.name,
    required this.username,
    required this.avatar,
  });

  @override
  String toString() {
    return 'userid: $userId\nname: $name\nusername: $username\navatar: ${avatar.toString()},';
  }

  factory User.fromMap(Map<String, dynamic> json) => _userFromMap(json);

  Map<String, dynamic> toMap() => _userToMap(this);
}

Map<String, dynamic> _userToMap(User user) {
  return Map<String, dynamic>.from({
    'id': user.userId,
    'name': user.name,
    'username': user.username,
    'avatar': user.avatar.toMap(),
  });
}

User _userFromMap(Map<String, dynamic> json) {
  int userId = json['id'];
  String name = json['name'];
  String username = json['username'];
  UserImage avatar = UserImage.fromMap(json['avatar']);
  return User(
    userId: userId,
    name: name,
    username: username,
    avatar: avatar,
  );
}

class UserImage {
  final String largeUrl;
  final String mediumUrl;
  final String thumbnail;

  UserImage({
    required this.largeUrl,
    required this.mediumUrl,
    required this.thumbnail,
  });

  @override
  String toString() {
    return '\n\tlarge: $largeUrl\n\tmedium: $mediumUrl\n\tthumbnail: $thumbnail\n';
  }

  factory UserImage.fromMap(Map<String, dynamic> json) =>
      _userImageFromMap(json);

  Map<String, dynamic> toMap() => _userImageToMap(this);
}

Map<String, dynamic> _userImageToMap(UserImage userImage) {
  return Map<String, dynamic>.from({
    'large': userImage.largeUrl,
    'medium': userImage.mediumUrl,
    'thumbnail': userImage.thumbnail,
  });
}

UserImage _userImageFromMap(Map<String, dynamic> json) {
  return UserImage(
    largeUrl: json['large'],
    mediumUrl: json['medium'],
    thumbnail: json['thumbnail'],
  );
}
