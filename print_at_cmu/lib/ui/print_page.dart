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
import 'package:print_at_cmu/ui/print_verification_panel.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PrintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);

    return SlidingUpPanel(
      body: _body(),
      panel: PrintVerificationPanel(),
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height / 2,
    );
  }

  Widget _body(){
    return Scaffold(
      appBar: AppBar(
        title: Text("Print@CMU"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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


            _br(),


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


            _br(),


            Row(
              children: <Widget>[

                Container(
                  padding: const EdgeInsets.fromLTRB(10,0,13,0),
                  child: _icon(Icons.crop_rotate),
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
              ],
            ),

            _br(),

            Row(
              children: <Widget>[

                SizedBox(width: 10,),

                _icon(FontAwesomeIcons.file),

                SizedBox(width: 10,),

                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Palette.PRIMARY_COLOR,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Select File",
                      style: TextStyle(
                        color: Palette.PRIMARY_COLOR
                      ),
                    ),
                  )
                ),
              ],
            ),

            _br(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){},
                  color: Palette.PRIMARY_COLOR,
                  child: Text(
                    "Print",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                SizedBox(width: 34,),
              ],
            ),

            SizedBox(height: 100,),

          ],
        ),
      ),
    );
  }

  Widget _icon(IconData data){
    return Container(
      padding: const EdgeInsets.fromLTRB(12,0,12,0),
      child: Icon(
        data,
        color: Palette.ACCENT_COLOR,
      ),
    );
  }

  Widget _br(){
    return SizedBox(height: 18,);
  }
}