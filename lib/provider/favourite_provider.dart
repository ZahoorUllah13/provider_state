import 'package:flutter/material.dart';
class FavouriteProvider with ChangeNotifier{
List<int> _slectedItem = [];
List<int> get selectitem=> _slectedItem;
void addItem(int value){
  _slectedItem.add(value);
  notifyListeners();
}
void removeItem(int value){
  _slectedItem.remove(value);
  notifyListeners();
}
}