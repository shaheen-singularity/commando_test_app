import 'package:commando_test_app/core/network/api_client.dart';
import 'package:commando_test_app/home/repository/repository.dart';
import 'package:commando_test_app/home/repository/repository_impl.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiClient>(ApiClient());
    Get.put<Repository>(RepositoryImpl());

  }
}