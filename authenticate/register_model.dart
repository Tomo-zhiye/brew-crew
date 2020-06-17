import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterModel extends ChangeNotifier {
//  Authorization
  final AuthService _auth = AuthService();
//  Form
//  final _formKey = GlobalKey<FormState>();
//  Confidentials
  String email = '';
  String password = '';
  String error = '';
  RegisterModel({this.email, this.password, this.error});

  Future singInAnon() async {
    dynamic result = await _auth.singInAnon();
    var condition = (result == null);
    return condition ? print('Something went wrong') : result;
    notifyListeners();
  }

  Future registerWithEmailAndPassWord() async {
    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
    (result == null)
        ? error = 'Please supply a valid email'
        : notifyListeners();
  }
}
