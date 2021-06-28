import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pet_finder/state/get/getx_user_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());
    Get.put<GetxUserController>(GetxUserController());
  }
}
