import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metra_dev/Scanner/scanner.dart';

import '../Console/Authentications/JWT.dart';
import '../Databases/Boxes/Boxes.dart';
import 'login.dart';
class ScannerRoute extends StatefulWidget {
  @override
  _ScannerRouteState createState() => _ScannerRouteState();
}

class _ScannerRouteState extends State<ScannerRoute> {

  @override
  void initState() {
    // : implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return _widget();
  }



Widget _widget(){
    switch(_pageRoutes()){
      case 'login':
        return LoginScanner();
      case 'scanner':
        return Scanner();
      default :
        return LoginScanner();
    }
}
  _pageRoutes(){
    List _routesList=['login','scanner'];
    if(Boxes.instance.scannerAuthBox.isNotEmpty){
      /// Authentication Available
      ///
      var _decodedAuth=JWT.decodeJWT(Boxes.instance.scannerAuthBox.get(Boxes.ScannerAuthKey));
      // print(_decodedAuth);
      var _o=jsonDecode(_decodedAuth);
      var _token=JWT.decodeJWT(_o['authenticationToken']);
     if(_token.toString().contains('_metra')){
       ///token accepted
       return _routesList[1];
     }else{
       ///token denied
       return _routesList[0];
     }

    }else if(Boxes.instance.scannerAuthBox.isEmpty){
      ///No Authentication Available
      ///
      return _routesList[0];

    }
  }
}
