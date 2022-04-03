import 'package:get_it/get_it.dart';
import 'package:stacked_api_implementation/services/api_service.dart';

GetIt locator = GetIt.instance;

dynamic setUpLocator() {
  locator.registerLazySingleton<ApiService>(() => ApiService());
}
