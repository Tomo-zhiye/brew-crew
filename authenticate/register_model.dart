import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String error = '';

//  SignInModel({this.email, this.password});

  void showError() {
    error = 'please supply a valid email';
    notifyListeners();
  }
}
