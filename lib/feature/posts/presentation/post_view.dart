import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_api_implementation/feature/constants/utils.dart';
import 'package:stacked_api_implementation/feature/posts/data_model/post_model.dart';
import 'package:stacked_api_implementation/feature/posts/presentation/post_view_model.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.nonReactive(
      viewModelBuilder: () => PostViewModel(),
      builder: (context, model, child) {
        return LayoutBuilder(builder: (context, constraints) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 1,
                backgroundColor: Colors.white38,
                title: const Center(
                  child: Text('Posts', style: TextStyle(color: Colors.black),),
                ),
              ),
              body: Center(
                child: FutureBuilder<List<Post>>(
                  future: model.post,
                  builder: (context, AsyncSnapshot<List<Post>> snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    List<Post> post = snapshot.data!;
                    return SizedBox(
                      height: constraints.maxHeight,
                      child: ListView.builder(
                        itemCount: post.length,
                        itemBuilder: (context, index) {
                          return PostCard(
                            post: post[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              PostUserImage(post: post),
              const SizedBox(
                width: 15,
              ),
              Text(
                post.user.username,
                style: postTextStyle().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            post.title,
            style: postTextStyle().copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            post.body,
            style: postTextStyle(),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class PostUserImage extends StatelessWidget {
  final Post post;

  const PostUserImage({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: NetworkImage(post.user.avatar.thumbnail),
    );
  }
}
