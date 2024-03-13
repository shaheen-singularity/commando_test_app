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
  RxBool powerSensorUpdateStatus = false.obs;

  Future onUpdateFire() async {
    try {
      _updateStateFire(ResourceUiState.loading());
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res.data["status"] == true) {
        fireSensorUpdateStatus.toggle();
        AppToast.showSuccess(res.data["message"].toString());
        _updateStateFire(ResourceUiState.success());
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
      _updateStateSmoke(ResourceUiState.loading());
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res.data["status"] == true) {
        smokeSensorUpdateStatus.toggle();
        AppToast.showSuccess(res.data["message"].toString());
        _updateStateSmoke(ResourceUiState.success());
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
      _updateStateShutter(ResourceUiState.loading());
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res.data["status"] == true) {
        shutterSensorUpdateStatus.toggle();
        AppToast.showSuccess(res.data["message"].toString());
        _updateStateShutter(ResourceUiState.success());
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
      _updateStateMotion(ResourceUiState.loading());
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res.data["status"] == true) {
        motionSensorUpdateStatus.toggle();
        AppToast.showSuccess(res.data["message"].toString());
        _updateStateMotion(ResourceUiState.success());
      } else {
        AppToast.showError(res.data["message"].toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
    }
  }

  Future onUpdatePower() async {
    try {
      _updateStatePower(ResourceUiState.loading());
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res.data["status"] == true) {
        powerSensorUpdateStatus.toggle();
        AppToast.showSuccess(res.data["message"].toString());
        _updateStatePower(ResourceUiState.success());
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
      _resetState(ResourceUiState.loading());
      final res = await repository.onReset(regNumber.value);
      if (res.data["status"] == true) {
        motionSensorUpdateStatus(false);
        smokeSensorUpdateStatus(false);
        fireSensorUpdateStatus(false);
        shutterSensorUpdateStatus(false);
        powerSensorUpdateStatus(false);
        AppToast.showSuccess("All sensor reset done!");
        _resetState(ResourceUiState.success());
      } else {
        AppToast.showError(res.data["message"].toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
      _resetState(ResourceUiState.error(e.toString()));
    }
  }

  final _updateStateFire = Rx<ResourceUiState>(ResourceUiState());
  Status get updateStateFire {
    return _updateStateFire.value.status;
  }

  final _updateStateSmoke = Rx<ResourceUiState>(ResourceUiState());
  Status get updateStateSmoke {
    return _updateStateSmoke.value.status;
  }

  final _updateStateShutter = Rx<ResourceUiState>(ResourceUiState());
  Status get updateStateShutter {
    return _updateStateShutter.value.status;
  }

  final _updateStateMotion = Rx<ResourceUiState>(ResourceUiState());
  Status get updateStateMotion {
    return _updateStateMotion.value.status;
  }

  final _updateStatePower = Rx<ResourceUiState>(ResourceUiState());
  Status get updateStatePower {
    return _updateStatePower.value.status;
  }

  final _resetState = Rx<ResourceUiState>(ResourceUiState());
  Status get resetState {
    return _resetState.value.status;
  }
}
