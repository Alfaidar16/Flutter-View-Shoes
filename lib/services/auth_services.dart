import 'dart:convert';

import 'package:flutter_latihan_1/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<UserModel> register(
      {String? name, String? email, String? password, String? phone}) async {
    var uri = '$baseUrl/register';
    var url = Uri.parse(uri);

    print(url);
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode(
        {'name': name, 'email': email, 'password': password, 'phone': phone});

    // ini response dari api postman
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer' + data['access_token'];

      return user;
    } else {
      throw Exception('GAGAL REGISTER');
    }
  }

  // Logic Login
  Future<UserModel> login({String? email, String? password}) async {
    var uri = '$baseUrl/login';
    var url = Uri.parse(uri);

    print(url);
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({'email': email, 'password': password});

    // ini response dari api postman
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer' + data['access_token'];

      return user;
    } else {
      throw Exception('GAGAL LOGIN');
    }
  }
}
