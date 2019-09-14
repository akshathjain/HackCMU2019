/*
Date: 9/14/19
Purpose: shows a confirmation that your document has printed
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        RaisedButton(
          onPressed: () {},
          textColor: Colors.yellow,
          color: Color(0xfffff700),

          child: Text(
            "See all printing locations"
          )
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center, 

    );
  }
}
