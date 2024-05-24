import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 1;

  int get count => _count;

  void incrementCounter() {
    _count++;
    notifyListeners();
  }

  void decrementCounter() {
    _count--;
    notifyListeners();
  }

  void resetCounter() {
    _count = 1;
    notifyListeners();
  }
}