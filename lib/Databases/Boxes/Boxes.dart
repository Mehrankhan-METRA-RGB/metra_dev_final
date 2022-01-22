


import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../saveCardsLocal.dart';


class Boxes{
  Boxes._private();
  static final Boxes instance=Boxes._private();
///:Box Keys
static const String VirtualCardAuthKey='VirtualCardAuthKey';
///auth store in local db in the form of {'secret':auth,'account':[{token:,name:,id:,nic:,}]}}
static const String ConsoleAuthKey='consoleAuthentication';
static const String ScannerAuthKey='scannerAuthentication';
static const String localSavedCardListKey='saveCardsLocal';
static const String CurrentThemeKey='currenttheme';
static const String MainRouteKey='MainRouteKey';
static const String ActivatedCardKey='activatedCard';
///Company store in local db in the of list I.e [id,companyName]
static const String CurrentCompanyKey='currentcompany';
// static const String authDataKey='authentication';
static const String localVirtualCardKey='localVirtualCard';
  ///List of cards ready for generating as PDF
static const String BytePNGCardsKey='BytePNGCardsKey';
///when we add a card to pdf we will add current user Id (employee or student id) to local storage with the following key
  ///we will upload these all data to server when we are generating PDF file
static const String tempCheckCardDecorationKey='tempCheckCardDecorationKey';
static const String ScannerUserHistoryKey='scannerUserHistory';
static const String scannerFetchedDataKey='scannerFetchedData';


  ///:Boxes
   Box<SaveCardsLocal> get savedLocalCardListBox => Hive.box<SaveCardsLocal>(Boxes.localSavedCardListKey);
   Box get activatedCardBox => Hive.box(Boxes.ActivatedCardKey);
   Box get themeBox => Hive.box(Boxes.CurrentThemeKey);
   Box get mainRouteBox => Hive.box(Boxes.MainRouteKey);
  ///auth store in local db in the form of {'secret':auth,'account':[{token:,name:,id:,nic:,}]}}
  Box get consoleAuthBox => Hive.box(Boxes.ConsoleAuthKey);
  ///contains current company name in Console Route
  Box get currentCompanyBox => Hive.box(Boxes.CurrentCompanyKey);
  ///Contains [{"decoration":CardCredentials}]
  Box get localVirtualCardBox => Hive.box(Boxes.localVirtualCardKey);
   Box get virtualCardAuthBox => Hive.box(Boxes.VirtualCardAuthKey);
   /// Box contain history of  users
  /// History store in the form of JSON like --> { data:[UserModel], time:[DateTime.now()], orientation:IN }
   Box get scannerUserHistoryBox => Hive.box(Boxes.ScannerUserHistoryKey);
///Scanner :Contain all User data downloaded from server Console API
   Box get scannerFetchedDataBox => Hive.box(Boxes.scannerFetchedDataKey);
  /// Saved as encoded Base64
  Box get scannerAuthBox => Hive.box(Boxes.ScannerAuthKey);
  ///data saved in this box String
  ///Uint8List converted to string and then saved in this box
   Box get bytePNGCardsBox => Hive.box(Boxes.BytePNGCardsKey);
  ///data saved in this box as {userId:,userDecoration:,}
   Box get tempCheckCardDecorationBox => Hive.box(Boxes.tempCheckCardDecorationKey);


  ///:Initialize Boxes
 static Future  openHiveBoxes()async{
    Directory appDocumentDir = await getApplicationDocumentsDirectory();
    // String appDocPath = appDocumentDir.path;
    ///create all  directories given in URI if not exist
    Directory('${appDocumentDir.path}/METRA/DataBase/')
        .createSync(recursive: true);
    Hive.init('${appDocumentDir.path}/METRA/DataBase/');
    Hive.registerAdapter(SaveCardsLocalAdapter());
    await Hive.openBox<SaveCardsLocal>(Boxes.localSavedCardListKey);
    await Hive.openBox(Boxes.CurrentThemeKey);
    await Hive.openBox(Boxes.CurrentCompanyKey);
    await Hive.openBox(Boxes.ConsoleAuthKey);
    await Hive.openBox(Boxes.VirtualCardAuthKey);
    await Hive.openBox(Boxes.localVirtualCardKey);
    await Hive.openBox(Boxes.ScannerAuthKey);
    await Hive.openBox(Boxes.MainRouteKey);
    await Hive.openBox(Boxes.ActivatedCardKey);
    await Hive.openBox(Boxes.BytePNGCardsKey);
    await Hive.openBox(Boxes.tempCheckCardDecorationKey);
    await Hive.openBox(Boxes.ScannerUserHistoryKey);
    await Hive.openBox(Boxes.scannerFetchedDataKey);
  }

  static Future  reOpenHiveBoxes()async{
    // Directory appDocumentDir = await getApplicationDocumentsDirectory();
    // // String appDocPath = appDocumentDir.path;
    // ///create all  directories given in URI if not exist
    // Directory('${appDocumentDir.path}/METRA/DataBase/')
    //     .createSync(recursive: true);
    // Hive.init('${appDocumentDir.path}/METRA/DataBase/');
    // Hive.registerAdapter(SaveCardsLocalAdapter());
   await Hive.boxExists(Boxes.localSavedCardListKey).then((boxExist) async=> (!boxExist)?await Hive.openBox<SaveCardsLocal>(Boxes.localSavedCardListKey):null);
   await  Hive.boxExists(Boxes.CurrentThemeKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.CurrentThemeKey):null);
   await  Hive.boxExists(Boxes.MainRouteKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.MainRouteKey):null);
   await  Hive.boxExists(Boxes.CurrentCompanyKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.CurrentCompanyKey):null);
   await  Hive.boxExists(Boxes.ConsoleAuthKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.ConsoleAuthKey):null);
   await  Hive.boxExists(Boxes.VirtualCardAuthKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.VirtualCardAuthKey):null);
   await  Hive.boxExists(Boxes.localVirtualCardKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.localVirtualCardKey):null);
   await  Hive.boxExists(Boxes.ScannerAuthKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.ScannerAuthKey):null);
   await  Hive.boxExists(Boxes.ActivatedCardKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.ActivatedCardKey):null);
   await  Hive.boxExists(Boxes.BytePNGCardsKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.BytePNGCardsKey):null);
   await  Hive.boxExists(Boxes.tempCheckCardDecorationKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.tempCheckCardDecorationKey):null);
   await  Hive.boxExists(Boxes.ScannerUserHistoryKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.ScannerUserHistoryKey):null);
   await  Hive.boxExists(Boxes.scannerFetchedDataKey).then((boxExist) async=> (!boxExist)?await Hive.openBox(Boxes.scannerFetchedDataKey):null);
}

}