import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsFormModel extends ChangeNotifier {
  final List<String> sugarList = [
    '0',
    '1',
    '2',
    '3',
    '4',
  ];
  String name;
  String sugars;
  int strength;
  SettingsFormModel({this.name, this.sugars, this.strength});

  void showStrength(val) {
    strength = val;
    notifyListeners();
  }

  void showName(val) {
    name = val;
    notifyListeners();
  }
}
