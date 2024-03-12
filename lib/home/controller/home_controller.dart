import 'package:commando_test_app/core/utils/resource_ui_state.dart';
import 'package:commando_test_app/core/view/app_toast.dart';
import 'package:commando_test_app/home/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Repository repository = Get.find();
  TextEditingController regNumberController = TextEditingController();

  RxString sensorType = ''.obs;
  RxInt value = 2.obs;
  RxInt regNumber = 00.obs;

  RxBool fireSensorUpdateStatus = false.obs;
  RxBool smokeSensorUpdateStatus = false.obs;
  RxBool shutterSensorUpdateStatus = false.obs;
  RxBool motionSensorUpdateStatus = false.obs;

  Future onUpdateFire() async {
    try {
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res.data["status"] == true) {
        fireSensorUpdateStatus.toggle();
        AppToast.showSuccess(res.data["message"].toString());

      } else {
        AppToast.showError(res.data["message"].toString());
      }

    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
    }
  }

  Future onUpdateSmoke() async {
    try {

      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res.data["status"] == true) {
        smokeSensorUpdateStatus.toggle();
        AppToast.showSuccess(res.data["message"].toString());

      } else {
        AppToast.showError(res.data["message"].toString());
      }

    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());

    }
  }

  Future onUpdateShutter() async {
    try {

      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res.data["status"] == true) {
        shutterSensorUpdateStatus.toggle();
        AppToast.showSuccess(res.data["message"].toString());

      } else {
        AppToast.showError(res.data["message"].toString());
      }

    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());

    }
  }

  Future onUpdateMotion() async {
    try {

      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if(res.data["status"] == true) {
        motionSensorUpdateStatus.toggle();
        AppToast.showSuccess(res.data["message"].toString());

      } else {
        AppToast.showError(res.data["message"].toString());
      }

    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());

    }
  }

  Future onReset() async {

    try {
      motionSensorUpdateStatus(false);
      smokeSensorUpdateStatus(false);
      fireSensorUpdateStatus(false);
      shutterSensorUpdateStatus(false);

      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res == true) {
        motionSensorUpdateStatus.toggle();
        AppToast.showError("Updated Successfully");
        final res = await repository.onReset(
            regNumber.value);
        if (res.data["status"] == true) {
          motionSensorUpdateStatus(false);
          smokeSensorUpdateStatus(false);
          fireSensorUpdateStatus(false);
          shutterSensorUpdateStatus(false);
          AppToast.showSuccess(res.data["message"].toString());
          _resetState(ResourceUiState.success());
        } else {
          AppToast.showError(res.data["message"].toString());
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
      _resetState(ResourceUiState.error(e.toString()));
    }

  }


  final _resetState = Rx<ResourceUiState>(ResourceUiState());
  Status get resetState {
    return _resetState.value.status;
  }
}


