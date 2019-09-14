/*
Name: Akshath Jain
Date: 9/13/19
Purpose: stores all network requests made by app
*/

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class Network{
  static Future<String> sendFile(String andrewid, int numcopies, String sidedness, File file, String filename) async {
    FormData formData = new FormData.from({
      "andrew_id": andrewid,
      "file": new UploadFileInfo(file, filename),
      "copies": numcopies,
      "sides": sidedness
    });

    var dio = Dio();
    final response = await dio.post("https://apis.scottylabs.org/print/v0/printfile", data: formData);
    return json.decode(response.toString())["message"];
  }
}