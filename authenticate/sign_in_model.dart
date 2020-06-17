import 'package:brew_crew/screens/authenticate/authenticate_model.dart';
import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';

class SignInModel extends ChangeNotifier {
//  Auth
  final AuthService _auth = AuthService();
//  Confidentials
  String email;
  String password;
  SignInModel({this.email, this.password});

  Future getUser() async {
    dynamic result = await _auth.singInAnon();
    var condition = (result == null);
    return condition ? print('Something went wrong') : result;
    notifyListeners();
  }
}
