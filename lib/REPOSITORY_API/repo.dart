import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:mvc_pattern_amiizz_tutorial/MODEL/about_info.dart';
import 'package:mvc_pattern_amiizz_tutorial/MODEL/availabilities.dart';

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

Future<USerInfo> getAboutInfoRepo(staff) async {
  final response = await http.get(
    Uri.encodeFull("https://carecanadajobs.com/public/api/profile?user_id="+staff.toString()),
  );
  print("SSSSSSSSSSSSSSSSSSSS "+response.statusCode.toString());
  if(response.statusCode == 200){
    return USerInfo.fromJson(jsonDecode(response.body));
  }
  else{
    print("*************** FAIL *******************************");
  }

  // var qData = json.decode(response.body);
  // return qData;
}

Future<Availabilities> getAvailabilityRepo(staff) async {
  final response = await http.get(
    Uri.encodeFull("https://carecanadajobs.com/public/api/availabilities?user_id="+staff.toString()),
  );
  if(response.statusCode == 200){
    return Availabilities.fromJson(jsonDecode(response.body));
  }
  else{
    print("*************** FAIL *******************************");
  }

  // var qData = json.decode(response.body);
  // return qData;
}

Future updateProfileImage(image,ext,staff) async {
  print("My image name : "+image.split("/").last);
  final String url = "https://carecanadajobs.com/public/api/updateavatar";
  final res = http.MultipartRequest('POST', Uri.parse(url),);
  res.files.add(
    http.MultipartFile(
        'file',
        File(image).readAsBytes().asStream(),
        File(image).lengthSync(),
        filename: image.split("/").last,contentType: MediaType("image", ext.toString().substring(1))
    ),
  );
  res.fields['user_id'] = staff.toString();
  http.Response response = await http.Response.fromStream(await res.send());
  var RegData = json.decode(response.body);
  return RegData;
}