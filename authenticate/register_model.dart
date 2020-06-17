import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterModel extends ChangeNotifier {
  final AuthService _auth = AuthService();
//  Confidentials
  String email;
  String password;
  RegisterModel({this.email, this.password});

  Future getUser() async {
    dynamic result = await _auth.singInAnon();
    var condition = (result == null);
    return condition ? print('Something went wrong') : result;
    notifyListeners();
  }
}
