import 'package:dio/dio.dart';

class PostModel {
  final String image;
  final String name;
  final String breed;
  final String sex;
  final String lsAddress;
  final DateTime lsDateTime;
  final String observation;
  final int userId;

  PostModel(
      {this.image,
      this.name,
      this.breed,
      this.sex,
      this.lsAddress,
      this.lsDateTime,
      this.observation,
      this.userId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['breed'] = this.breed;
    data['sex'] = this.sex;
    data['ls_address'] = this.lsAddress;
    data['ls_datatime'] = this.lsDateTime;
    data['observation'] = this.observation;
    data['userId'] = this.userId;
    return data;
  }

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'image': await MultipartFile.fromFile(this.image),
      'name': this.name,
      'breed': this.breed,
      'sex': this.sex,
      'ls_address': this.lsAddress,
      'ls_datetime': this.lsDateTime,
      'observation': this.observation,
      'user_id': this.userId,
    });
  }
}

class PostModelDetail {
  final String image;
  final String name;
  final String breed;

  PostModelDetail({this.image, this.name, this.breed});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['breed'] = this.breed;
    return data;
  }
}
