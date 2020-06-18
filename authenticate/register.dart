import 'package:brew_crew/screens/authenticate/register_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  final Function toggleView;
  Register({this.toggleView});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterModel>(
      create: (_) => RegisterModel(),
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign up to Brew Crew'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  this.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('Sign in'))
          ],
        ),
        body: Consumer<RegisterModel>(builder: (context, model, child) {
          final error = model.error;
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                      validator: (val) =>
                          val.trim().isEmpty ? 'Must not be empty' : null,
                      onChanged: (val) {
                        model.email = val;
                      }),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    onChanged: (val) {
                      model.password = val;
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        model.registerWithEmailAndPassWord();
                      }
                    },
                  ),
                  SizedBox(height: 12),
                  Text(
//                    問題の箇所,
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
