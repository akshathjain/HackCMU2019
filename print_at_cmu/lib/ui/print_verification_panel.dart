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
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            "Print Job Successful",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center
          ),

          SizedBox(height: 60,),

          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette.SUCCESS,
                width: 2.8
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: Palette.SUCCESS,
              size: 28.0,
            ),
          ),


          SizedBox(height: 60),


          RaisedButton(
            onPressed: () => launch('http://www.cmu.edu/computing/services/endpoint/printing-kiosks/locations.html'),
            textColor: Colors.white,
            color: Palette.ACCENT_COLOR,
            child: Text(
              "See all Printing Locations"
            )
          )

        ],
      )
    );
  }

}
