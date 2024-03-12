import 'package:commando_test_app/core/network/api_client.dart';
import 'package:commando_test_app/core/utils/constant.dart';
import 'package:commando_test_app/home/repository/repository.dart';
import 'package:get/get.dart';

class RepositoryImpl extends Repository {
  ApiClient apiClient = Get.find();

  @override
  Future onUpdate(int id, String type, int value) async {
    try {
      final response = await apiClient.post("$UPDATE$id&$type=$value");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
