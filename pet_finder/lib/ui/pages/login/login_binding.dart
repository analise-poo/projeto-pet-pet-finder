import 'package:pet_finder/state/get/getx_login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());
    Get.put<GetxLoginController>(GetxLoginController());
  }
}
