import 'package:brew_crew/screens/authenticate/register_model.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final _formKey = GlobalKey<FormState>();
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
          centerTitle: true,
        ),
        body: Consumer<RegisterModel>(builder: (context, model, child) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) =>
                        val.isEmpty ? 'Must not be empty' : null,
                    onChanged: (val) {
                      model.email = val;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      model.password = val;
                    },
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print(model.email);
                        print(model.password);
                        dynamic result =
                            await _auth.registerWithEmailAndPassword(
                                model.email, model.password);
                        if (result == null) {
                          model.showError();
                        }
                      }
                    },
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    model.error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
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
