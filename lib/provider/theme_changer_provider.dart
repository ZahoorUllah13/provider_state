import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  var _themeMode=ThemeMode.light;
  ThemeMode get mode=>_themeMode;
  void setTheme(ThemeMode){
    _themeMode=ThemeMode;
    notifyListeners();
  }
}