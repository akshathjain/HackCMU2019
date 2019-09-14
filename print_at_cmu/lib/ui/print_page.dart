/*
Name: Akshath Jain
Date: 9/13/19
Purpose: home page that allows users to print file
*/

import 'package:flutter/material.dart';
import 'package:print_at_cmu/bloc/app_state.dart';
import 'package:provider/provider.dart';

class PrintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Print@CMU"),
      ),
      body: Container(
        child: Center(
          child: Text(appState.counter.toString()),
        ),
      ),
    );
  }
}