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
      fireSensorUpdateStatus(false);
      _updateStateFire(ResourceUiState.loading());
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res == true) {
        fireSensorUpdateStatus.toggle();
      } else {
        AppToast.showError("Registration number is not found");
      }
      _updateStateFire(ResourceUiState.success());
    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
      _updateStateFire(ResourceUiState.error(e.toString()));
    }
  }

  Future onUpdateSmoke() async {
    try {
      smokeSensorUpdateStatus(false);
      _updateStateSmoke(ResourceUiState.loading());
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res == true) {
        smokeSensorUpdateStatus.toggle();
      } else {
        AppToast.showError("Registration number is not found");
      }
      _updateStateSmoke(ResourceUiState.success());
    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
      _updateStateSmoke(ResourceUiState.error(e.toString()));
    }
  }

  Future onUpdateShutter() async {
    try {
      shutterSensorUpdateStatus(false);
      _updateStateShutter(ResourceUiState.loading());
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res == true) {
        shutterSensorUpdateStatus.toggle();
      } else {
        AppToast.showError("Registration number is not found");
      }
      _updateStateShutter(ResourceUiState.success());
    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
      _updateStateShutter(ResourceUiState.error(e.toString()));
    }
  }

  Future onUpdateMotion() async {
    try {
      motionSensorUpdateStatus(false);
      _updateStateMotion(ResourceUiState.loading());
      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res == true) {
        motionSensorUpdateStatus.toggle();
        AppToast.showError("Updated Successfully");
      } else {
        AppToast.showError("Registration number is not found");
      }
      _updateStateMotion(ResourceUiState.success());
    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
      _updateStateMotion(ResourceUiState.error(e.toString()));
    }
  }

  Future onReset() async {
    try {
      motionSensorUpdateStatus(false);
      smokeSensorUpdateStatus(false);
      fireSensorUpdateStatus(false);
      shutterSensorUpdateStatus(false);

      _resetState(ResourceUiState.loading());

      final res = await repository.onUpdate(
          regNumber.value, sensorType.value, value.value);
      if (res == true) {
        motionSensorUpdateStatus.toggle();
        AppToast.showError("Updated Successfully");
      } else {
        AppToast.showError("Enter Valid ID");
      }
      _resetState(ResourceUiState.success());
    } catch (e) {
      debugPrint(e.toString());
      AppToast.showError(e.toString());
      _resetState(ResourceUiState.error(e.toString()));
    }
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

final _resetState = Rx<ResourceUiState>(ResourceUiState());
Status get resetState {
  return _resetState.value.status;
}
