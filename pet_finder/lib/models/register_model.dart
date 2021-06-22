class RegisterModel {
  final String name;
  final String phone;
  final String email;
  final String password;

  RegisterModel({this.name, this.phone, this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
