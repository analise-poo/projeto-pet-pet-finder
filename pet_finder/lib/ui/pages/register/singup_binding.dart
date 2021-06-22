import 'package:pet_finder/state/get/getx_register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GetxRegisterController>(GetxRegisterController());
  }
}
