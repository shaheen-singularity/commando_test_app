import 'package:commando_test_app/core/utils/resource_ui_state.dart';
import 'package:commando_test_app/core/view/app_toast.dart';
import 'package:commando_test_app/home/dto/sensor_response.dart';
import 'package:commando_test_app/home/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  Repository repository = Get.find();
  TextEditingController regNumberController = TextEditingController();

  RxString sensorType = ''.obs;
  RxInt value = 2.obs;
  RxInt regNumber = 00.obs;
  RxBool temp = false.obs;

  Future onUpdate() async {
    try{
      _updateState(ResourceUiState.loading());
      final res = await repository.onUpdate(regNumber.value, sensorType.value, value.value);
      final result = SensorResponse.fromJson(res);
      if(result.status == true){
        temp.toggle();
      }
      _updateState(ResourceUiState.success());
    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
      _updateState(ResourceUiState.error(e.toString()));
    }
  }

}

final _updateState = Rx<ResourceUiState>(ResourceUiState());
Status get updateState {
  return _updateState.value.status;
}