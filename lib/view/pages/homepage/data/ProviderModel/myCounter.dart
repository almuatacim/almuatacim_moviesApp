import 'package:flutter/material.dart';

class MyCounter extends ChangeNotifier {
  int counter = 0;
  String text = "tttttt";
  inc() {
    counter++;
    notifyListeners();
  }

  dec() {
    counter--;
    notifyListeners();
  }
}
