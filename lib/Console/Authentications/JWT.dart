import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../Databases/Boxes/Boxes.dart';
import '../Name_Logo.dart';
import '../UserList.dart';

class JWT{

  ///
/// Encode any data to base64UrlEncode
  ///
  /// Mostly it will encode JSON,s data
  ///
  /// JsonEncoded --> codeUnits OR UTF-8 Encode --> base64UrlEncode
  static encodeJWT(data){
   return base64UrlEncode(jsonEncode(data).codeUnits);
  }

  /// data -->  base64Url.normalize  -->  Decode base64Url   -->  Decode UTF-8
  static decodeJWT(token){
    return utf8.decode(base64Url.decode(base64Url.normalize(token)));
  }









  ///others
 static  get getLocalConsoleAuth  {
   ///Get Login Authentication Token from Local Storage
   ///auth store in local db in the form of {'secret':auth,'account':[{token:,name:,id:,nic:,}]}}
   var _data=Boxes.instance.consoleAuthBox.get(Boxes.ConsoleAuthKey);
   if(_data==null){
     return null;
   }else{
     var decoded=jsonDecode(_data);
     return decoded;
   }

 }

// static saveFirstPageRoute(data,String? boxKey)async{
//
//    await Boxes.instance.mainRouteBox.put(boxKey, data);
// }


static  Future<List<CompanyModel>> companyList(token) async {
  List? data;
  try {
    var res = await http.get(Uri.parse(
        'http://localhost:8080/get/companies/$token')); // var a=jsonEncode(res.body);
    data = jsonDecode(res.body);

    ///Connection available

  } on SocketException {
    ///Connection not  available

    print('No Internet connection 😑');

    /// show error in text field  after 4 seconds while have connection error

  } on HttpException {
    print("Couldn't find the post 😱");
  } on FormatException {
    print("Bad response format 👎");
  }
  return data!.map((companies) => CompanyModel.fromJson(companies)).toList();
}





 static Future<List<UserModel>> fetchUsers(nic,companyCode) async {
   var response = await http.get(Uri.parse('http://localhost:8080/getUsers/$companyCode/$nic'));
   if (response.statusCode == 200) {
     List data = jsonDecode(response.body);
     print(response.body);
     return data.map((user) => UserModel.fromJson(user)).toList();
   } else {
     // If the server did not return a 200 OK response,
     // then throw an exception.
     throw Exception('Failed to load companies data');
   }
 }


}