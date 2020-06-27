import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';

class AuthenticateModel extends ChangeNotifier {
//  Route
  bool showSignIn = true;

  void toggleView() {
    showSignIn = !showSignIn;
    notifyListeners();
  }
}
