/*
Name: Akshath Jain
Date: 9/13/19
Purpose: stores app state
*/

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:print_at_cmu/assets/strings.dart';
import 'package:print_at_cmu/async/network.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppState with ChangeNotifier{
  String _andrewId;
  int _numberCopies;
  String _sidedness = Strings.SIDE_DEFAULT;
  File _file;
  PanelController _pc;

  AppState(){
    _pc = new PanelController();
  }

  String get andrewId => _andrewId;
  set andrewId(String s){
    this._andrewId = s;
    notifyListeners();
  }

  int get numberCopies => _numberCopies;
  set numberCopies(int x){
    this._numberCopies = x;
    notifyListeners();
  }

  String get sidedness => _sidedness;
  set sidedness(String s){
    this._sidedness = s;
    notifyListeners();
  }

  String get fileName{
    if(_file == null) return "";

    List strings = _file.path.split("/");
    return strings[strings.length - 1];
  }

  PanelController get panelController => _pc;

  void selectFile() async{
    _file = await FilePicker.getFile(type: FileType.ANY);
    notifyListeners();
  }

  void sendToPrinter(BuildContext context) async{
    if(_andrewId != null && _numberCopies != null && _sidedness != null && _file != null){
      String side;

      if(sidedness == Strings.SIDE_TWO_SIDED_LANDSCAPE)
        side = "two-sided-long-edge";
      else if(sidedness == Strings.SIDE_TWO_SIDED_PORTRAIT)
        side = "two-side-short-edge";
      else
        side = "one-sided";

      Map response = await Network.sendFile(andrewId, numberCopies, side, _file, fileName);
      print(response);
      if(response["status_code"] == 200){
        _pc.open();
      }else{
        Flushbar(
          messageText: Text(
            response["message"],
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          animationDuration: Duration(milliseconds: 400),
          duration: Duration(milliseconds: 3000),
          flushbarStyle: FlushbarStyle.FLOATING,
          borderRadius: 24.0,
          margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
          boxShadows: [BoxShadow(
            blurRadius: 14.0,
            color: Color.fromRGBO(0,0,0,0.3),
          )],
        )..show(context);
      }
    }
  }

}