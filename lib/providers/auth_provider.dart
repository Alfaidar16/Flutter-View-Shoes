import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/models/user_model.dart';
import 'package:flutter_latihan_1/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user = UserModel(name: '', email: '', password: '', phone: '');

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? name,
    String? email,
    String? password,
    String? phone,
  }) async {
    try {
      UserModel user = await AuthService()
          .register(name: name, email: email, password: password, phone: phone);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // provider login
  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
