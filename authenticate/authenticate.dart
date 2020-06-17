import 'package:brew_crew/screens/authenticate/authenticate_model.dart';
import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sing_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticateModel>(
      create: (_) => AuthenticateModel(),
      child: Consumer<AuthenticateModel>(builder: (context, model, child) {
        return (model.showSignIn)
            ? SignIn(toggleView: model.toggleView)
            : Register(toggleView: model.toggleView);
      }),
    );
  }
}
