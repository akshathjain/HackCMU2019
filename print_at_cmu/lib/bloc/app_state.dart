/*
Name: Akshath Jain
Date: 9/13/19
Purpose: stores app state
*/

import 'package:flutter/cupertino.dart';

class AppState with ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;

  void increment() => _counter++;
}