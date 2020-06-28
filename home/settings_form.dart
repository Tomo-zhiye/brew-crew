import 'package:brew_crew/screens/home/settings_form_model.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsFormModel>(
      create: (_) => SettingsFormModel(),
      child: Consumer<SettingsFormModel>(builder: (context, model, child) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Updates brew settings',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              Center(
                child: TextFormField(
                  decoration: textInputDecoration,
                  validator: (val) =>
                      val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => model.showName(val),
                ),
              ),
              SizedBox(height: 20.0),
//            ここです　dropdown
              Center(
                child: DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: model.sugars ?? '0',
                    iconEnabledColor: Colors.pink,
                    items: model.sugarList.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(),
                    onChanged: (val) => model.sugars = val),
              ),
//            slider
              Slider(
                value: (model.strength ?? 100).toDouble(),
                min: 100.0,
                max: 900.0,
                divisions: 8,
                activeColor: Colors.brown[model.strength ?? 100],
                inactiveColor: Colors.brown[model.strength ?? 100],
                onChanged: (val) => model.showStrength(val.round()),
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(model.name);
                  print(model.strength);
                  print(model.sugars);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
