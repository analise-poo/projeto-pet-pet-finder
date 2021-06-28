import 'dart:io';

import 'package:pet_finder/models/register_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetxRegisterController extends GetxController {
  Future<void> register(RegisterModel registerModel) async {
    try {
      print('POST api/register');
      print('${registerModel.toJson()}');

      await Dio().post(
        'https://backend-pet-finder.herokuapp.com/api/register',
        data: registerModel.toJson(),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
    } on DioError catch (d) {
      print('MESSAGE: ${d.message}');
      throw Exception('Aconteceu um erro no Dio!');
    } catch (e) {
      print(e);
      throw Exception('Aconteceu algum erro inesperado!');
    }
  }
}
