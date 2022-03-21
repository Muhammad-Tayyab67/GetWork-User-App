// ignore: file_names
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestAssitant {
  static Future<dynamic> getRequest(Uri url) async {
    // ignore: unused_local_variable
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        String JsonData = response.body;
        var decode = jsonDecode(JsonData);
        return decode;
      } else {
        return "failed";
      }
    } catch (exp) {
      return "failed";
    }
  }
}
