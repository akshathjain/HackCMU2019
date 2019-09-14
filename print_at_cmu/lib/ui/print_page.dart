/*
Name: Akshath Jain
Date: 9/13/19
Purpose: home page that allows users to print file
*/

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:print_at_cmu/assets/colors.dart';
import 'package:print_at_cmu/assets/strings.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 32, 0),
              child: TextField(
                decoration: InputDecoration(
                  hasFloatingPlaceholder: true,
                  labelText: Strings.ANDREW_ID_HINT,
                  icon: _icon(Icons.person_outline),
                ),
              ),
            ),


            SizedBox(height: 18,),


            Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 32, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hasFloatingPlaceholder: true,
                  labelText: Strings.NUM_PAGES_HINT,
                  icon: _icon(FontAwesomeIcons.file),
                ),
              ),
            ),

            DropdownButton<String>(
              value: "One Sided",
              onChanged: (String x) => {},
              items: ["One Sided", "Two Sided (portrait)", "Two Sided (landscape)"].map((x){
                return DropdownMenuItem<String>(
                  value: x,
                  child: Text(x),
                );
              }).toList(),
            ),

            SizedBox(height: 155,),

          ],
        ),
      ),
    );
  }

  Widget _icon(IconData data){
    return Container(
      padding: const EdgeInsets.fromLTRB(8,0,14,0),
      child: Icon(
        data,
        color: Palette.ACCENT_COLOR,
      ),
    );
  }
}