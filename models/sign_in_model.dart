import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';

class SignInModel extends ChangeNotifier {
  final AuthService _auth = AuthService();

  Future getUser() async {
    dynamic result = await _auth.singInAnon();
    var condition = (result == null);
    condition ? print('Something went wrong') : print(result);
    notifyListeners();
  }
}
