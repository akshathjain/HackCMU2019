/*
Name: Akshath Jain
Date: 9/13/19
Purpose: main file for printing app
*/

import 'package:flutter/material.dart';
import 'package:print_at_cmu/assets/colors.dart';
import 'package:print_at_cmu/bloc/app_state.dart';
import 'package:print_at_cmu/ui/print_page.dart';
import 'package:provider/provider.dart';

import 'ui/print_verification_panel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Print@CMU',
      theme: ThemeData(
        primaryColor: Palette.PRIMARY_COLOR,
        accentColor: Palette.ACCENT_COLOR
      ),
      home: ChangeNotifierProvider<AppState>(
        builder: (_) => AppState(),
        child: Material(
          child: PrintPage(),
        ),
      ),
    );
  }
}
