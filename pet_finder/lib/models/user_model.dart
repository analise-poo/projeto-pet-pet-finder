import 'package:dio/dio.dart';

class UserModel {
  final String avatar;
  final String name;
  final String phone;
  final String email;

  UserModel({this.avatar, this.name, this.phone, this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'avatar': await MultipartFile.fromFile(this.avatar),
      'name': this.name,
      'phone': this.phone,
      'email': this.email
    });
  }
}
