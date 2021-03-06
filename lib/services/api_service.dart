import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stacked_api_implementation/feature/posts/data_model/post_model.dart';
import 'package:stacked_api_implementation/feature/user/data_model/user_model.dart';

const String linkUrl = 'engineering.league.dev';
const String apiKey = 'A7750436673601F4C45731349B7B3DE5';
Uri url = Uri.parse('https://engineering.league.dev/challenge/api');

class ApiService {
  final http.Client client = http.Client();
  ///beginning of Api getter methods
  Future<List<User>> getUsers() async {
    Uri userUrl = Uri.parse('$url/users');
    http.Response response =
        await client.get(userUrl, headers: {'x-access-token': apiKey});

    if (response.statusCode == 200) {
      List<dynamic> newList = jsonDecode(response.body) as List<dynamic>;

      List<User> userList = [];
      for (var element in newList) {
        Map<String, dynamic> newElement = element as Map<String, dynamic>;
        userList.add(User.fromMap(newElement));
      }
      return userList;
    }
    return Future.error(
        'error ${response.statusCode}: unable to process request');
  }

  dynamic getPost(User user) async {
    Uri postUrl = Uri.parse('$url/posts?userId=${user.userId}');
    http.Response response = await http.get(
      postUrl,
      headers: {'x-access-token': apiKey},
    );

    if (response.statusCode == 200) {
      List<dynamic> rawPosts = jsonDecode(response.body);
      List<PostModel> posts = [];

      for (var element in rawPosts) {
        posts.add(PostModel.fromMap(element as Map<String, dynamic>));
      }

      return posts;
    }
    return Future.error(
        'error ${response.statusCode}: unable to process request');
  }

  Future<List<PostModel>> getAllPosts() async {
    List<User> users = await getUsers();
    List<PostModel> newPost = [];

    for (User user in users) {
      newPost.addAll((await getPost(user)));
    }
    return newPost;
  }
  Future<User> getUserFromId(int userId) async {
    List<User> users = await getUsers();
    for (User user in users) {
      if (user.userId == userId) {
        return user;
      }
    }
    return Future.error('user not found');
  }

  ///End of Api getter methods

  ///For the main application
  ///the application will only use this method
  Future<List<Post>> getPostList() async {
    List<PostModel> posts = await getAllPosts();
    List<Post> newPosts = [];
    for (PostModel post in posts) {
      User user = await getUserFromId(post.userId);
      newPosts.add(Post(
        postId: post.postId,
        user: user,
        title: post.title,
        body: post.body,
      ));
    }

    return newPosts;
  }
}
