import 'package:pet_finder/state/get/getx_bottom_controller.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GetxBottomController>(GetxBottomController());
  }
}
