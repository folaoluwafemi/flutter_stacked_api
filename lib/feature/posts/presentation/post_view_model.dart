import 'package:stacked/stacked.dart';
import 'package:stacked_api_implementation/feature/posts/data_model/post_model.dart';
import 'package:stacked_api_implementation/services/api_service.dart';
import 'package:stacked_api_implementation/services/locator_service.dart';

class PostViewModel extends BaseViewModel {
  final Future<List<Post>> _posts = locator<ApiService>().getPostList();

  Future<List<Post>> get post => _posts;
}
