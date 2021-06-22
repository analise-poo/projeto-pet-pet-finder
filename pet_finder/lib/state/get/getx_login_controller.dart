import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as FSStorage;

import 'package:pet_finder/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetxLoginController extends GetxController {
  Future<void> login(LoginModel loginModel) async {
    final FSStorage.FlutterSecureStorage storage =
        Get.find<FSStorage.FlutterSecureStorage>();

    try {
      print('POST api/login');
      print('${loginModel.toJson()}');

      var response = await Dio().post(
        'http://192.168.0.7:8000/api/login',
        data: loginModel.toJson(),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );

      print(response);

      await storage.write(key: 'mobile', value: response.data);

      print(response.data);
    } on DioError catch (d) {
      // print('STATUS CODE: ${d.response.statusCode}');
      print('MESSAGE: ${d.message}');
      throw Exception('Aconteceu um erro no Dio!');
    } catch (e) {
      print(e);
      throw Exception('Aconteceu algum erro inesperado!');
    }
  }
}
