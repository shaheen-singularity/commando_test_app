import 'package:commando_test_app/core/utils/resource_ui_state.dart';
import 'package:commando_test_app/core/view/app_toast.dart';
import 'package:commando_test_app/home/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  Repository repository = Get.find();
  TextEditingController regNumberController = TextEditingController();

  RxString type = ''.obs;
  RxInt value = 2.obs;
  RxInt id = 00.obs;

  Future onUpdate() async {
    try{
      _updateState(ResourceUiState.loading());
      await repository.onUpdate(id.value, type.value, value.value);
      _updateState(ResourceUiState.success());
    } catch (e) {
      AppToast.showError(e.toString());
      _updateState(ResourceUiState.error(e.toString()));
    }
  }

}

final _updateState = Rx<ResourceUiState>(ResourceUiState());
Status get updateState {
  return _updateState.value.status;
}