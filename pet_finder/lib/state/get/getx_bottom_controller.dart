import 'package:get/get.dart';

class GetxBottomController extends GetxController {
  final index = Rx<int>(1);

  void changeIndex(int index) {
    if (index >= 0 && index < 3) {
      index = index;
    }
  }
}
