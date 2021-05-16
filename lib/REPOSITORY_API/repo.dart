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

Future getStatics(staff) async {
  final response = await http.get(
    Uri.encodeFull("https://carecanadajobs.com/public/api/staff_statistics?staff_id="+staff.toString()),
  );
  var qData = json.decode(response.body);
  return qData;
}

Future getAboutInfoRepo(staff) async {
  final response = await http.get(
    Uri.encodeFull("https://carecanadajobs.com/public/api/profile?user_id="+staff.toString()),
  );
  var qData = json.decode(response.body);
  return qData;
}

Future getAvailabilityRepo(staff) async {
  final response = await http.get(
    Uri.encodeFull("https://carecanadajobs.com/public/api/availabilities?user_id="+staff.toString()),
  );
  var qData = json.decode(response.body);
  return qData;
}