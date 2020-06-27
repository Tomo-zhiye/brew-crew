import 'package:flutter/material.dart';

class SignInModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

//  SignInModel({this.email, this.password});

  void showError() {
    error = 'could not sign in with those credentials';
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
