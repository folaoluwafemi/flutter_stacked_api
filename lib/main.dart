import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_api_implementation/feature/posts/presentation/post_view.dart';
import 'package:stacked_api_implementation/services/locator_service.dart';

void main() {
  setUpLocator();
  runApp(const PostApp());
}

class PostApp extends StatelessWidget {
  const PostApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white60,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return const MaterialApp(
      home: PostView(),
    );
  }
}
