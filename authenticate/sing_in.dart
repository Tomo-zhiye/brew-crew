import 'package:brew_crew/screens/models/sign_in_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInModel>(
      create: (_) => SignInModel(),
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sing in to Brew Crew'),
        ),
        body: Consumer<SignInModel>(builder: (context, model, child) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: RaisedButton(
              child: Text('Sign in anon'),
              onPressed: () async {
                dynamic result = model.getUser();
                print('signed in');
                print(result);
              },
            ),
          );
        }),
      ),
    );
  }
}
