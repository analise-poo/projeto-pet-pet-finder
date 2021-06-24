import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as FSStorage;

import 'package:pet_finder/models/post_model.dart';

class GetxPostController extends GetxController {
  Future<void> createPost(PostModel postModel) async {
    final FSStorage.FlutterSecureStorage storage =
        Get.find<FSStorage.FlutterSecureStorage>();

    var token = await storage.read(key: 'token');

    try {
      print('POST api/posts');
      print('${await postModel.toFormData()}');

      var response = await Dio().post(
        'https://backend-pet-finder.herokuapp.com/api/posts',
        data: await postModel.toFormData(),
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

  Future<List> details() async {
    final FSStorage.FlutterSecureStorage storage =
        Get.find<FSStorage.FlutterSecureStorage>();

    var token = await storage.read(key: 'token');

    try {
      print('GET api/posts/details');

      var response = await Dio().get(
        'https://backend-pet-finder.herokuapp.com/api/posts/details',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );

      return response.data;
    } on DioError catch (d) {
      print('MESSAGE: ${d.message}');
      throw Exception('Aconteceu um erro no Dio!');
    } catch (e) {
      print(e);
      throw Exception('Aconteceu algum erro inesperado!');
    }
  }

  Future getPost(int postId) async {
    final FSStorage.FlutterSecureStorage storage =
        Get.find<FSStorage.FlutterSecureStorage>();

    var token = await storage.read(key: 'token');

    try {
      print('GET api/posts/$postId');

      var response = await Dio().get(
        'https://backend-pet-finder.herokuapp.com/api/posts/$postId',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
      );

      print(response.data);
      return response.data;
    } on DioError catch (d) {
      print('MESSAGE: ${d.message}');
      throw Exception('Aconteceu um erro no Dio!');
    } catch (e) {
      print(e);
      throw Exception('Aconteceu algum erro inesperado!');
    }
  }
}
