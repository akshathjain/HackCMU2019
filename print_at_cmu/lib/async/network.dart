/*
Name: Akshath Jain
Date: 9/13/19
Purpose: stores all network requests made by app
*/

import 'package:http/http.dart' as http;

class Network{
  static Future<void> sendFile() async {
    await http.post("https://apis.scottylabs.org/print/v0/printfile/",
      body: {
        "andrew_id": "",
        "file": "",
        "copies": "",
        "sides": "",
      },
    );
  }
}