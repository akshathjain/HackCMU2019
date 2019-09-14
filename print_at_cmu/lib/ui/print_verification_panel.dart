/*
Date: 9/14/19
Purpose: shows a confirmation that your document has printed
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:print_at_cmu/assets/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PrintVerificationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Print job successfully sent",
          style: TextStyle(
            height: 5,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center
        ),
        _icon(FontAwesomeIcons.checkCircle),
        SizedBox(height: 20),
        RaisedButton(
          onPressed: () => launch('http://www.cmu.edu/computing/services/endpoint/printing-kiosks/locations.html'),
          textColor: Colors.white,
          color: Palette.ACCENT_COLOR,

          child: Text(
            "See all printing locations"
          )
        )
      ],
      mainAxisAlignment: MainAxisAlignment.start, 

    );
  }
  Widget _icon(IconData data){
    return Container(
      padding: const EdgeInsets.fromLTRB(8,0,14,0),
      child: Icon(
        data,
        color: Colors.green,
        size: 50.0,
      ),
    );
  }
}
