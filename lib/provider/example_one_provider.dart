import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier{
 int count=0;
int get value=>count;
void setCount(){
 count++;
 notifyListeners();
}
}
class ShowProvider with ChangeNotifier{
 double value=1.0;
 double get val=>value;
 void setValue(double val){
  value=val;
  notifyListeners();
 }
}