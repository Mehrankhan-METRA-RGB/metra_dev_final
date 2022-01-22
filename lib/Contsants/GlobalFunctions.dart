

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:metra_dev/Databases/Boxes/Boxes.dart';
import '../Console/Authentications/JWT.dart';
import '../Scanner/scanner.dart';
import '../metra_startpage.dart';
import 'app.dart';

class Global{
  Global._private();
  static final Global instance=Global._private();

 void logout(BuildContext context,{route})async {
  dynamic _logoutConsole(){ Boxes.instance.consoleAuthBox.deleteFromDisk();
   Boxes.instance.bytePNGCardsBox.deleteFromDisk();
   Boxes.instance.mainRouteBox.deleteFromDisk();
   Boxes.instance.currentCompanyBox.deleteFromDisk();
   Boxes.instance.activatedCardBox.deleteFromDisk();}
  dynamic _logoutScanner(){Boxes.instance.scannerAuthBox.deleteFromDisk();
   Boxes.instance.scannerFetchedDataBox.deleteFromDisk();
  Boxes.instance.mainRouteBox.deleteFromDisk();
   Boxes.instance.scannerUserHistoryBox.deleteFromDisk();}
  dynamic  _logoutVirtual(){Boxes.instance.virtualCardAuthBox.deleteFromDisk();
   Boxes.instance.localVirtualCardBox.deleteFromDisk();
  Boxes.instance.mainRouteBox.deleteFromDisk();}

   switch(route){
     case AppRoute.console:
     _logoutConsole();
       break;
     case AppRoute.scanner:
   _logoutScanner();
       break;
     case AppRoute.virtualCard:
       _logoutVirtual();
       break;
     case AppRoute.index:
   _logoutConsole();
   _logoutScanner();
   _logoutVirtual();
       break;
     default:
       App.snackBar(context,textColor: Colors.white70,color: Colors.red,text: 'Invalid Route');
   }
  DefaultCacheManager().emptyCache();
   await Boxes.reOpenHiveBoxes();
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AppStartPage()),);
 }
String  qrEncryptor({int? userId}) {
    var auth,decodedAuth,company;
    if(Boxes.instance.consoleAuthBox.containsKey(Boxes.ConsoleAuthKey)){
      auth= Boxes.instance.consoleAuthBox.get(Boxes.ConsoleAuthKey);
      decodedAuth=jsonDecode(auth);
      company= Boxes.instance.currentCompanyBox.get(Boxes.CurrentCompanyKey);
    }

    var _data = {
      'companyId':company!=null?company[0]:0,
      'token':decodedAuth!=null?decodedAuth['account'][0]['token']:'demo_123_metra',
      'userId':userId!=null?userId:0,
    };

    ///Create Token for QR CODE
    var _encoded='${JWT.encodeJWT(_data)}.${Scanner.ScannerKey}';
    return _encoded.toString();
  }
  int daysPerMonth({int? month}) {
    if (month == null) {
      month = DateTime.now().month;
    }

    switch (month) {
    // Cases for 31 Days
      case 1:
        return 31;
      case 3:
        return 31;
      case 5:
        return 31;
      case 7:
        return 31;
      case 8:
        return 31;
      case 10:
        return 31;
      case 12:
        return 31;

    // Cases for 30 Days
      case 4:
        return 30;
      case 6:
        return 30;
      case 9:
        return 30;
      case 11:
        return 30;

    // Case for Normal year 28 Days / Leap year 29 Days
      case 2:
        var currentYear = DateTime.now().year;
        if (currentYear % 4 == 0 &&
            currentYear % 100 != 0 &&
            currentYear % 400 != 0) {
          print('Leap Year');
          return 29;
        } else {
          print('Normal Year');
          return 28;
        }

      default:
        print("Invalid Month.");
        return 0;
    }
  }

  ///return month name
  ///index will be [1 to 12]
  String month(index) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[index - 1];
  }
}