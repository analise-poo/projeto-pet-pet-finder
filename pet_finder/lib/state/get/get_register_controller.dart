import 'package:pet_finder/models/register_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetxRegisterController extends GetxController {
  Future<void> register(RegisterModel registerModel) async {
    try {
      print('POST api/register');
      print('${registerModel.toJson()}');

      var response = await Dio().post(
        'http://127.0.0.1:8000/api/register',
        data: registerModel.toJson(),
      );

      // await storage.write(key: 'token', value: response.data);

      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
