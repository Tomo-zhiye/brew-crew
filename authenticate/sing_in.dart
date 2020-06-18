import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Function toggleView;
  SignIn({this.toggleView});
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
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  this.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('Register'))
          ],
        ),
        body: Consumer<SignInModel>(builder: (context, model, child) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(onChanged: (val) {
                    model.email = val;
                  }),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val) {
                      model.password = val;
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {},
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
