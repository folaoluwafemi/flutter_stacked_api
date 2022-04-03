import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_api_implementation/feature/posts/data_model/post_model.dart';
import 'package:stacked_api_implementation/feature/posts/presentation/post_view_model.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.nonReactive(
      viewModelBuilder: () => PostViewModel(),
      builder: (context, model, child) {
        return SafeArea(
            child: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<List<Post>>(
                  future: model.post,
                  builder: (context, AsyncSnapshot<List<Post>> snapshot) {
                    if(!snapshot.hasData){
                      return const CircularProgressIndicator();
                    }
                    if(snapshot.connectionState == ConnectionState.waiting)
                  },
                ),
                ElevatedButton(
                  onPressed: () async {},
                  child: const Text('something'),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
