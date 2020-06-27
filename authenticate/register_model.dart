import 'package:flutter/material.dart';

class RegisterModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

//  SignInModel({this.email, this.password});

  void showError() {
    error = 'please supply a valid email';
    notifyListeners();
  }

  void showLoading() {
    loading = true;
    notifyListeners();
  }

  void hideLoading() {
    loading = false;
    notifyListeners();
  }
}
