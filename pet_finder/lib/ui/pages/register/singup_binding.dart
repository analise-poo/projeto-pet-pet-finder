import 'package:pet_finder/state/get/get_register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GetxRegisterController>(GetxRegisterController());
  }
}
