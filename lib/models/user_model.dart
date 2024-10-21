class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? token;

  UserModel(
      {this.id, this.name, this.password, this.email, this.phone, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'token': token,
    };
  }
}
