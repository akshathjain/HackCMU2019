/*
Name: Akshath Jain
Date: 9/13/19
Purpose: stores all network requests made by app
*/

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Network{
  static Future<void> sendFile(String andrewid, int numpages, String sidedness, File file) async {
    print('here');
    var request = http.MultipartRequest("POST", Uri.parse("https://apis.scottylabs.org/print/v0/printfile/"));
    request.fields['andrew_id'] = andrewid;
    request.fields['copies'] = numpages.toString();
    request.fields['sides'] = sidedness;
    request.files.add(new http.MultipartFile.fromBytes('file', await file.readAsBytes()));

    final response = await http.Response.fromStream(await request.send());
    print(response.body);
    print(json.decode(response.body));

    // await http.post("",
    //   body: {
    //     "andrew_id": andrewid,
    //     "file": "",
    //     "copies": "",
    //     "sides": "",
    //   },
    // );
  }
}