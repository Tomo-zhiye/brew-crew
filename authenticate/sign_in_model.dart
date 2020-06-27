import 'package:flutter/material.dart';

class SignInModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String error = '';

//  SignInModel({this.email, this.password});

  void showError() {
    error = 'could not sign in with those credentials';
    notifyListeners();
  }
}
