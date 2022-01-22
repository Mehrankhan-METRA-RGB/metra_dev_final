import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:better_sound_effect/better_sound_effect.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../Console/Authentications/JWT.dart';
import '../Console/UserList.dart';
import '../Contsants/Data.dart';
import '../Contsants/app.dart';
import '../Databases/Boxes/Boxes.dart';
import '../Test/test.dart';
import 'history.dart';

class Scanner extends StatefulWidget {
  static const ScannerKey = 'METRA-PAK';
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override
  Widget build(BuildContext context) {
    return QRViewExample();
  }
}

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  List<QRScannerModel> listData = [];
  bool isAlreadyAdded = true;
  var _width;
  bool isAllRepeat = true;
  bool isNotRecognized = true;
  bool isCameraPause = true;
  final soundEffect = BetterSoundEffect();
  int? detectedSoundID;
  int? alreadyAddedSoundID;
  int? notRecognizedSoundID;
  var lastDetectedUserId;
  var lastDetectedUserCompanyId;
  Barcode? result;
///Result Method variables
  Widget? _widget;
  var tempId=00;
///Not recognized
bool?  isNotRecognizedWigetShow=true;


  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var _orientation;
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
    ///this widget will be initially show below QR camera
    _widget =Center(
        child: Container(
          color: Colors.red.withOpacity(0.2),
          width: _width,
          child:App.tileText(context, heading: "Scan a Company's Card",
              value: "Result will show here",
          valueStyle: TextStyle(fontSize: 8,color:Colors.black45),
          headingStyle: TextStyle(fontSize: 11,color:Colors.black54),
          textScale: 2,
          horizontalAlignment:CrossAxisAlignment.center ),
        ));
    _orientation = jsonDecode(JWT.decodeJWT(Boxes.instance.scannerAuthBox
        .get(Boxes.ScannerAuthKey)))['orientation'];
    Future.microtask(() async {
      detectedSoundID =
          await soundEffect.loadAssetAudioFile("assets/sounds/detected.mp3");
      alreadyAddedSoundID = await soundEffect
          .loadAssetAudioFile("assets/sounds/alreadyAdded.mp3");
      notRecognizedSoundID = await soundEffect
          .loadAssetAudioFile("assets/sounds/NotRecognized.mp3");
    });
  }

  @override
  Widget build(BuildContext context) {
    _width=MediaQuery.of(context).size.width;

    return Scaffold(
      endDrawer: App.drawer(context,actions: [
        IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryScanner())),

          icon: Icon(
            Icons.history_sharp,
            color: NeumorphicTheme.currentTheme(context)
                .appBarTheme
                .iconTheme!
                .color,
          ),
          tooltip: 'History'
          ,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>TestLogin()));
          },

          icon: Icon(
            Icons.download_rounded,
            color: NeumorphicTheme.currentTheme(context)
                .appBarTheme
                .iconTheme!
                .color,
          ),
          tooltip: 'History'
          ,
        ),
        Spacer(),
      ]),
      body: Platform.isAndroid
          ? Column(
            children: [
              ///QR Camera
              Expanded(flex: 5, child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  _cameraQrView(context),
                  /// buttons over camera
                  _cameraButtons(),
                  ///Orientation show
                  Positioned(bottom: 20,right: 20,
                    child: Text('$_orientation'),),
                ],
              )),

              /// show result of qr code
              Expanded(flex: 4, child: _result()),
            ],
          )
          : Container(
              child:
                  Center(child: Text('Scanner is available only for Android')),
            ),
    );
  }

  Widget _result() {
    ///initialize Not Recognized widget
    Widget? _notRecognizedWidget()=>Center(
    child: Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          App.tileText(context, heading: 'Card not Recognized',
              value: 'It belongs to ${result!.code
              .substring(result!.code.length - 10, result!.code.length)}',
              textScale: 2,
horizontalAlignment: CrossAxisAlignment.center,
              valueStyle:TextStyle(fontSize: 9,color: Colors.white54) )

        ],
      ),
    ));
    ///initialize Recognized widget
    double scale=1.2;
    Widget? _recognizedWidget( UserModel element) {
      Stream<FileResponse>? _getImageFromCacheMemory() {
        // ignore: unused_local_variable
        List<Stream<FileResponse>>? _data = [];
        Stream<FileResponse>? fileStream;
        fileStream = DefaultCacheManager().getFileStream('http://$androidLocalHost:8080/${element.imageUrl}'.replaceAll('%', '/').replaceAll('\\', '/'));
        return fileStream;
      }

       // ignore: unused_local_variable
       var _imageurl=element.imageUrl!.replaceAll('%', '/').replaceAll('\\', '/');
       return Container( color: Color(0xff69c155),
            padding: EdgeInsets.symmetric(vertical:5,horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child:StreamBuilder<FileResponse?>(
                stream: _getImageFromCacheMemory(),
           builder: (context, snapshot) {
             FileInfo fileInfo = snapshot.data as FileInfo;
             if(snapshot.hasData){
               return Image.file(
                 fileInfo.file,
                 width: 80,
                 height: 80,
                 fit: BoxFit.fill,
               );
             }
             else if(snapshot.hasError){
               return Text('error');
             }
             else{return Image.asset(
               'assets/images/profilepng.jpg',
               width: 80,
               height: 80,
               fit: BoxFit.fill,
             );}

           })),
                SizedBox(height: 10),
                App.tileText(context,
                  heading: 'Name:', value: element.name,textScale: scale,),
                App.tileText(context,
                    heading: 'NIC:', value: element.NIC,textScale: scale),
                App.tileText(context,
                    heading:'Role ', value: element.role,textScale: scale),

              ],
            ),
          );}

    Boxes.instance.scannerFetchedDataBox.values
        .toList()
        .map((json) => UserModel.fromJson(jsonDecode(json)))
        .where((element) => element.id == lastDetectedUserId)
        .forEach((user) {


      // print(element.name);
      ///  Save scanned data in local history
///[if] is used to avoid adding same user multiple times in local history
      if(user.id!=tempId){
        var _json = {
          'data': user.toJson(),
          'time': DateTime.now().toString(),
          'orientation': _orientation
        };
        Boxes.instance.scannerUserHistoryBox.add(jsonEncode(_json));

        tempId=user.id!;}

      ///We are initializing which Widget to show to user
      ///if QRCODE is valid then show result other wise show not-recognized widget
      if(isNotRecognizedWigetShow!){_widget=_notRecognizedWidget();}else{_widget=_recognizedWidget(user);}

    });

    return _widget!;
  }

  Widget _cameraQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (_width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 190.0
        : 330.0;
    Future<void> _onQRViewCreated(QRViewController controller) async {

      setState(() {
        this.controller = controller;
      });
      var status = await Permission.camera.status;
      if (status.isDenied) {
        // We didn't ask for permission yet or the permission has been denied before but not permanently.
        print('permission denied');
      }
      else if(status.isGranted){
        print('permission granted');
      }

// You can can also directly ask the permission about its status.
      if (await Permission.location.isRestricted) {
        // The OS restricts access, for example because of parental controls.
      }


      controller.scannedDataStream.listen(
            (scanData) {
          setState(() {


            result = scanData;
          });

          _scannerListener();
        },
      );
    }

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.indigo,
          borderRadius: 1,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  Widget _cameraButtons() {
    return Positioned(
        top: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: IconButton(
                onPressed: () async {
                  if (isCameraPause) {
                    print('Camera Paused');
                    await controller?.pauseCamera();
                  } else {
                    print('Camera Resumed');
                    await controller?.resumeCamera();
                  }
                  setState(() {
                    isCameraPause = !isCameraPause;
                  });
                  // print(listData);
                },
                icon: Icon(
                  isCameraPause
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                  color: Colors.white60,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: IconButton(
                  onPressed: () async {
                    await controller?.toggleFlash();
                    setState(() {});
                  },
                  icon: FutureBuilder(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                      return snapshot.data != null
                          ? Icon(
                              snapshot.data == true
                                  ? Icons.flash_on
                                  : Icons.flash_off,
                              color: Colors.white60,
                            )
                          : Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            );
                    },
                  )),
            ),

            Container(
              margin: EdgeInsets.all(8),
              child: IconButton(
                  onPressed: () async {
                    await controller?.flipCamera();


                    // setState(() {});
                  },
                  icon: FutureBuilder(
                    future: controller?.getCameraInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print('camera:${describeEnum(snapshot.data!)}');
                        return Icon(
                          Icons.flip_camera_android_sharp,
                          color: Colors.white60,
                        );
                      } else {
                        return Icon(
                          Icons.camera_front,
                          color: Colors.white60,
                        );
                      }
                    },
                  )),
            )
          ],
        ));
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      App.snackBar(context,
          text: 'no Permission',
          color: Colors.redAccent,
          textColor: Colors.white60);
    }
  }


//   ///
//   _binarySearch(value) {
//     UserModel? _detectedData;
//     int dataLength = Boxes.instance.scannerFetchedDataBox.length;
//
//     var _array = Hive.box(Boxes.scannerFetchedDataKey).values.toList();
//     var array =
//         _array.map((json) => UserModel.fromJson(jsonDecode(json))).toList();
//
//     ///binary search
// //     print(array);
// //    int lowerBound=1;
// //    int upperBound=dataLength;
// // var go=true;
// //    while(go){
// //      print(go);
// //      print(value);
// //      if(upperBound<lowerBound){print('value not exist');
// //      int midPoint=((lowerBound+(upperBound-lowerBound))~/2).toInt();
// //      if(array[midPoint].id!.toInt()<value){
// //        lowerBound=midPoint+1;
// //      }
// //      if(array[midPoint].id!.toInt()>value){
// //        upperBound=midPoint-1;
// //      }
// //      if(array[midPoint].id!.toInt()==value){
// //        print('value found at location midpoint');
// //        go=false;
// //      }
// //      }
//     // }
//     Boxes.instance.scannerFetchedDataBox.values
//         .toList()
//         .map((json) => UserModel.fromJson(jsonDecode(json)))
//         .where((element) => element.id == lastDetectedUserId)
//         .forEach((element) {
//       // if (element.id == lastDetectedUserId) {
//         print(element.name);
//       ///  Save scanned data in local history
//         var tempId=00;
//             var _json = {
//               'data': element.toJson(),
//               'time': DateTime.now().toString(),
//               'orientation': _orientation
//             };
//             print('${element.id!}--$tempId');
//             if(element.id!=tempId){
//               Boxes.instance.scannerUserHistoryBox.add(jsonEncode(_json));
//               tempId=element.id!;
//             }
//
//
//             // print('Name:${_detectedData.name}');
//
//
//       // }
//     });
//
//     // print(a);
//     // for (var index = 0;
//     // index < Boxes.instance.scannerFetchedDataBox.length;
//     // index++) {
//     //   var user = Boxes.instance.scannerFetchedDataBox.getAt(index);
//     //   var _userDecode = jsonDecode(user);
//     //   var model = UserModel.fromJson(_userDecode);
//     //   // print('Name:${model.name }||Id:${model.id }||lastDetectedUserId:$lastDetectedUserId');
//     //   if (lastDetectedUserId != null) {
//     //     if (model.id == lastDetectedUserId) {
//     //       setState(() {
//     //         _detectedData = model;
//     //       });
//     //
//     //
//     // }
//   }


  ///capture QR Code according to app Requirement
  void _scannerListener() async {
    /// QRCode Validation

    if (result!.code
        .substring(result!.code.length - 10, result!.code.length)
        .contains(Scanner.ScannerKey)) {
      ///hide not recognized widget
      setState(() {
        isNotRecognizedWigetShow=false;
      });
      if (isAllRepeat) {
        print(result!.code);

        var fromEncodedToJson = JWT.decodeJWT(result!.code.split('.')[0]);
        var decode = jsonDecode(fromEncodedToJson);
        // print(decode);
        QRScannerModel model = QRScannerModel.fromJson(decode);

        if (listData.length == 0) {
          // var data = jsonEncode(model);
          print('.......................adding first user........................');

          ///Assign data of current units to current results in result box
          lastDetectedUserId = model.userId;
          lastDetectedUserCompanyId = model.companyId;

          ///  Save scanned data in local history
          // await Boxes.instance.scannerUserHistoryBox.add(data);
          listData.add(model);
          _playSound(detectedSoundID);
        } else if (listData.length > 0) {
          if (model.userId != lastDetectedUserId) {
            // var data = jsonEncode(model);
            print('.......................adding user........................');

            ///Assign data to current units to current results in result box
            lastDetectedUserId = model.userId;
            lastDetectedUserCompanyId = model.companyId;

            _playSound(detectedSoundID);

            ///if qr detected multi times only once the sound will be played
            // Timer(Duration(seconds: 4),(){isAlreadyAdded=true;});
            isAlreadyAdded = true;
          } else if (model.userId == lastDetectedUserId) {
            if (isAlreadyAdded) {
              _playSound(alreadyAddedSoundID);

              ///we make it false to avoid repetition of sound play
              isAlreadyAdded = false;
              Timer(Duration(seconds: 5), () {
                isAlreadyAdded = true;
              });
            }
          }
        }

        isAllRepeat = false;
        Timer(Duration(seconds: 5), () {
          isAllRepeat = true;
        });
      }
    } else {
      ///Show not recognized widget
      setState(() {
        print('.......................Not recognized........................');

        isNotRecognizedWigetShow=true;
      });
      ///If card did recognized by our machine
      if (isNotRecognized) {
        print(result!.code);
        _playSound(notRecognizedSoundID);

          isNotRecognized = !isNotRecognized;

        Timer(
            Duration(
              seconds: 4,
            ), () {
          isNotRecognized = true;


        });
      }
    }
  }
  // void _scannerListener() async {
  //   /// QRCode Validation
  //
  //   if (result!.code
  //       .substring(result!.code.length - 10, result!.code.length)
  //       .contains(Scanner.ScannerKey)) {
  //     if (isAllRepeat) {
  //       print(result!.code);
  //
  //       var fromEncodedToJson = JWT.decodeJWT(result!.code.split('.')[0]);
  //       var decode = jsonDecode(fromEncodedToJson);
  //       // print(decode);
  //       QRScannerModel model = QRScannerModel.fromJson(decode);
  //
  //       if (listData.length == 0) {
  //         // var data = jsonEncode(model);
  //
  //         ///Assign data of current units to current results in result box
  //         lastDetectedUserId = model.userId;
  //         lastDetectedUserCompanyId = model.companyId;
  //
  //         ///  Save scanned data in local history
  //         // await Boxes.instance.scannerUserHistoryBox.add(data);
  //         listData.add(model);
  //         _playSound(detectedSoundID);
  //       } else if (listData.length > 0) {
  //
  //         if (model.userId != listData.last.userId) {
  //           // var data = jsonEncode(model);
  //
  //           ///Assign data to current units to current results in result box
  //           lastDetectedUserId = model.userId;
  //           lastDetectedUserCompanyId = model.companyId;
  //
  //           _playSound(detectedSoundID);
  //
  //           ///if qr detected multi times only once the sound will be played
  //           // Timer(Duration(seconds: 4),(){isAlreadyAdded=true;});
  //           isAlreadyAdded = true;
  //         } else if (model.userId == listData.last.userId) {
  //           if (isAlreadyAdded) {
  //             _playSound(alreadyAddedSoundID);
  //
  //             ///we make it false to avoid repetition of sound play
  //             isAlreadyAdded = false;
  //             Timer(Duration(seconds: 5), () {
  //               isAlreadyAdded = true;
  //             });
  //           }
  //         }
  //       }
  //
  //       isAllRepeat = false;
  //       Timer(Duration(seconds: 5), () {
  //         isAllRepeat = true;
  //       });
  //     }
  //   } else {
  //     if (isNotRecognized) {
  //       print(result!.code);
  //       _playSound(notRecognizedSoundID);
  //       isNotRecognized = !isNotRecognized;
  //       Timer(
  //           Duration(
  //             seconds: 5,
  //           ), () {
  //         isNotRecognized = true;
  //       });
  //     }
  //   }
  // }

  void _playSound(int? soundID) {
    if (soundID != null) {
      if (result != null) soundEffect.play(soundID);
      // soundEffect.release(soundId!);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    if (detectedSoundID != null) {
      soundEffect.release(detectedSoundID!);
    }
    if (alreadyAddedSoundID != null) {
      soundEffect.release(alreadyAddedSoundID!);
    }
    if (notRecognizedSoundID != null) {
      soundEffect.release(notRecognizedSoundID!);
    }
    super.dispose();
  }
}

class QRScannerModel {
  final int? companyId;
  final int? userId;

  ///Example:token Will be found in Box.ConsoleAuth['account'][0]['token'] in console Route
  final String? token;
  QRScannerModel({this.companyId, this.userId, this.token});
  factory QRScannerModel.fromJson(Map<String, dynamic> json) {
    return QRScannerModel(
        companyId: json['companyId'],
        userId: json['userId'],
        token: json['token']);
  }
  Map<String, dynamic> toJson() {
    return {
      'companyId': companyId,
      'uid': userId,
      'token': token,
    };
  }
}
