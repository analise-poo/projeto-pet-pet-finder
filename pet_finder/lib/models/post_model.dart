class PostModel {
  final String image;
  final String name;
  final String breed;
  final String sex;
  final String lsAddress;
  final String lsDateTime;
  final String observation;

  PostModel(
      {this.image,
      this.name,
      this.breed,
      this.sex,
      this.lsAddress,
      this.lsDateTime,
      this.observation});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['breed'] = this.breed;
    data['sex'] = this.sex;
    data['ls_address'] = this.lsAddress;
    data['ls_datatime'] = this.lsDateTime;
    data['observation'] = this.observation;
    return data;
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
