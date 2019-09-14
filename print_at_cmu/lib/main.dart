/*
Name: Akshath Jain
Date: 9/13/19
Purpose: main file for printing app
*/

import 'package:flutter/material.dart';
import 'package:print_at_cmu/ui/print_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Print@CMU',
      home: PrintPage(),
    );
  }
}
