import 'package:pet_finder/state/get/getx_post_controller.dart';
import 'package:pet_finder/state/get/getx_user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());
    Get.put<GetxPostController>(GetxPostController());
    Get.put<GetxUserController>(GetxUserController());
  }
}
