import 'package:oktoast/oktoast.dart';

class AppToast {
  static void showSuccess(message){
    showToast(
        message,
        position: ToastPosition.bottom,
        dismissOtherToast: true
    );
  }
  static void showError(message){
    showToast(
        message,
        position: ToastPosition.bottom,
        dismissOtherToast: true
    );
  }
}