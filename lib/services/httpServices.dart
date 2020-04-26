// import 'dart:convert';

import 'package:http/http.dart';

class DataSent {
  static var ip = '192.168.1.100:4000/api';
  final urls = "http://$ip/all-phrases";

  // Future<List> incoming() async {
  //   Response res = await get(urls);
  //   // print(json.decode(res.body));
  //   if (res.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(res.body).toList();
  //     //  jsonDecode(res.body).toList();
  //     // List body = decodes.();
  //     print(body);
  //     return body;
  //   } else {
  //     throw Exception('failed to get data');
  //   }
  //   // return ;
  // }

   Future <int> signup(firstName, lastName, phoneNumber, password) async {
    final _url = 'http://$ip/auth/signup';
    Response results =await post(
      _url,
      body: {
        'firstName':firstName,
        'lastName':lastName,
        'phoneNumber': phoneNumber,
        'password': password,
      },
    );
      // var decodedData =jsonDecode(results.body);
print("sign up responce ${results.statusCode}");
    return  results.statusCode;
  }
    Future <int>login(phoneNumber, password) async {
    final url = 'http://$ip/auth/signin';
    Response results =await post(
      url,
      body: {
     
        'phoneNumber': phoneNumber,
        'password': password,
      },
    );
      // var decodedData =jsonDecode(results.body);
print("login responce ${results.statusCode}");
    return  results.statusCode;
  }
}
