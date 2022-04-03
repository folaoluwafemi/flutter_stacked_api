import 'package:stacked/stacked.dart';
import 'package:stacked_api_implementation/feature/posts/data_model/post_model.dart';
import 'package:stacked_api_implementation/services/api_service.dart';
import 'package:stacked_api_implementation/services/locator_service.dart';

class PostViewModel extends BaseViewModel {
  var service = locator.

  final List<Post> _posts = [];

  List<Post> get post => _posts;
}
