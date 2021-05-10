import 'dart:convert';

import 'package:http/http.dart' as http;

Future signInRepo(username,password) async {
  final String url = "https://carecanadajobs.com/public/api/login";
  final res = await http.post(url, body: {
    "username": username,
    "password": password,
    "role": "staff",
    "device_token": "123456",
  });
  var data = json.decode(res.body);
  return data;
}