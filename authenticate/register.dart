import 'package:brew_crew/screens/authenticate/register_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  final Function toggleView;
  Register({this.toggleView});
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
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print(model.email);
                      print(model.password);
                    },
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
