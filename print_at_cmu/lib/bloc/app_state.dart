/*
Name: Akshath Jain
Date: 9/13/19
Purpose: stores app state
*/

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:print_at_cmu/async/network.dart';

class AppState with ChangeNotifier{
  String _andrewId;
  int _numberCopies;
  String _sidedness = "One Sided";
  File _file;

  String get andrewId => _andrewId;
  set andrewId(String s){
    this._andrewId = s;
    print(_andrewId);
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

  void selectFile() async{
    _file = await FilePicker.getFile(type: FileType.ANY);
    notifyListeners();
  }

  void sendToPrinter() async{
    print(_andrewId);
    print(_numberCopies);
    print(_sidedness);
    print(_file);
    if(_andrewId != null && _numberCopies != null && _sidedness != null && _file != null){
      String side;

      if(sidedness == "Two Sided (landscape)")
        side = "two-sided-long-edge";
      else if(sidedness == "Two Sided (portrait)")
        side = "two-side-short-edge";
      else
        side = "one-sided";

      Network.sendFile(andrewId, numberCopies, side, _file, fileName);
    }
  }

}