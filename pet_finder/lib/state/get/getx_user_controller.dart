import 'dart:io';

import 'package:pet_finder/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetxUserController extends GetxController {
  Future<void> register(UserModel userModel) async {
    try {
      print('POST api/register');
      print('${userModel.toJson()}');

      await Dio().post(
        'https://backend-pet-finder.herokuapp.com/api/register',
        data: userModel.toJson(),
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
