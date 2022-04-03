import 'package:flutter/material.dart';
import 'package:stacked_api_implementation/feature/posts/presentation/post_view.dart';
import 'package:stacked_api_implementation/services/locator_service.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: PostView(),
    );
  }
}
