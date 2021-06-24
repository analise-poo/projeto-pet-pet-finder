import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as FSStorage;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pet_finder/models/user_model.dart';

class GetxUserController extends GetxController {
  Future getUser() async {
    final FSStorage.FlutterSecureStorage storage =
        Get.find<FSStorage.FlutterSecureStorage>();

    var userId = await storage.read(key: 'user_id');
    var token = await storage.read(key: 'token');

    try {
      print('GET api/users/$userId');

      var response = await Dio().get(
        'https://backend-pet-finder.herokuapp.com/api/users/$userId',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );

      print(response);
      return response.data;
    } on DioError catch (d) {
      print('MESSAGE: ${d.message}');
      throw Exception('Aconteceu um erro no Dio!');
    } catch (e) {
      print(e);
      throw Exception('Aconteceu algum erro inesperado!');
    }
  }

  Future<void> updateUserProfile(UserModel userModel, int userId) async {
    final FSStorage.FlutterSecureStorage storage =
        Get.find<FSStorage.FlutterSecureStorage>();

    var token = await storage.read(key: 'token');

    try {
      print('POST api/users/$userId/updateProfile');
      print('${await userModel.toFormData()}');

      var response = await Dio().post(
        'https://backend-pet-finder.herokuapp.com/api/users/$userId/updateProfile',
        data: await userModel.toFormData(),
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'multipart/form-data',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );

      print(response.data);
    } on DioError catch (d) {
      print('MESSAGE: ${d.message}, RESPONSE: ${d.response}');
      throw Exception('Aconteceu um erro no Dio!');
    } catch (e) {
      print(e);
      throw Exception('Aconteceu algum erro inesperado!');
    }
  }

  Future<int> getCurrentUserId() async {
    final FSStorage.FlutterSecureStorage storage =
        Get.find<FSStorage.FlutterSecureStorage>();

    return int.parse(await storage.read(key: 'user_id'));
  }
}
