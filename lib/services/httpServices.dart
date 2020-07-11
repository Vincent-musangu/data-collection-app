// import 'dart:convert';

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class DataSent {
  static var ip = '192.168.43.246:4000/api';
  final urls = "http://$ip/all-phrases";
  final transUrl = "http://$ip/phrases";
  final phraseUrl = "http://$ip/translate/phrase";
 var storage = new FlutterSecureStorage();


  Future incoming() async {
                                              var access=await storage.read(key: 'jwt');

    Response res = await get(transUrl,headers: {'x-access-token':access});
    print((res.statusCode));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body) as Map;
      // var body=jsonDecode(res.body) ;
      //  jsonDecode(res.body);
      // List body = decodes.();
      // print(res.body);
      return body;
    }
    // return ;
  } 
  Future outgoing(newData,id) async {
var access=await storage.read(key: 'jwt');

    Response res = await post(phraseUrl,body:{'phraseId':id.toString(),'tonga':newData} 
    ,headers: {'x-access-token':access});
    print((res.body));
    print(access);
    // if (res.statusCode ==  200|| res.statusCode ==  201) {
    //   // List<dynamic> body = jsonDecode(res.body).toList();
    //   var body=jsonDecode(res.body) as Map;
    //   //  jsonDecode(res.body);
    //   // List body = decodes.();
    //   // print(res.body);
    //   return body;
    // } else {
    //   throw Exception('failed to get data');
    // }
    return res.statusCode;
  } 


  Future<int> signup(firstName, lastName, phoneNumber, password) async {
    final _url = 'http://$ip/auth/signup';
    Response results = await post(
      _url,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'password': password,
      },
    );
    // var decodedData =jsonDecode(results.body);
    print("sign up responce ${results.statusCode}");
    return results.statusCode;
  }

  Future login(phoneNumber, password) async {
    final url = 'http://$ip/auth/signin';
    Response results = await post(
      url,
      body: {
        'phoneNumber': phoneNumber,
        'password': password,
      },
    );

    var decodedData =jsonDecode(results.body) as Map;
    // print("login responce ${results.statusCode}");
    if (results.statusCode == 200  || results.statusCode == 201) {
      // print(results.body);
      var success={
        'statusCode': results.statusCode,
        'bodyMassege' :decodedData
      };
      //  print(success);
      return success;
    }
    
     if (results.statusCode == 404 || results.statusCode == 401) {
      // print("user not found ${results.statusCode}");
      var failure={
         'statusCode': results.statusCode,
      };
      return failure;
    }
    // return null;
  }
}
