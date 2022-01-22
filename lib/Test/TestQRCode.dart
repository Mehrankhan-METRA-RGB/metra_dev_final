// import 'package:ai_barcode/ai_barcode.dart';
// import 'package:flutter_qr_reader/flutter_qr_reader.dart';
// import 'package:ai_barcode_example/full_screen_scanner_page.dart';
// import 'package:ai_barcode_example/task_next_page.dart';
// import 'package:ai_barcode_example/testing_page.dart';
// import 'creator_page.dart';
// import 'custom_size_scanner_page.dart';
// import 'select_scanner_style_page.dart';
// import 'package:qrcode/qrcode.dart';

// class FlutterQRReader extends StatefulWidget {
//   @override
//   _FlutterQRReaderState createState() => _FlutterQRReaderState();
// }
//
// class _FlutterQRReaderState extends State<FlutterQRReader> {
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//
//   bool _flashlightState = false;
//   bool _showScanView = false;
//   QrReaderViewController? _controller;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   void alert(String tip) {
//     ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(SnackBar(content: Text(tip)));
//   }
//
//   void openScanUI(BuildContext context) async {
//     if (_showScanView) {
//       await stopScan();
//     }
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//       return new Scaffold(
//         body: QrCodeReaderView(
//           // onScan: (result) async {
//           //   Navigator.of(context).pop();
//           //   alert(result);
//           // },
//
//           // headerWidget: AppBar(
//           //   backgroundColor: Colors.transparent,
//           //   elevation: 0.0,
//           // ),
//           height: 200,
//         ),
//       );
//     }));
//   }
//
//   // Future<bool> permission() async {
//   //   if (_openAction) return false;
//   //   _openAction = true;
//   //   var status = await Permission.camera.status;
//   //   print(status);
//   //   if (status.isDenied || status.isPermanentlyDenied) {
//   //     status = await Permission.camera.request();
//   //     print(status);
//   //   }
//   //
//   //   if (status.isRestricted) {
//   //     alert("请必须授权照相机权限");
//   //     await Future.delayed(Duration(seconds: 3));
//   //     openAppSettings();
//   //     _openAction = false;
//   //     return false;
//   //   }
//   //
//   //   if (!status.isGranted) {
//   //     alert("请必须授权照相机权限");
//   //     _openAction = false;
//   //     return false;
//   //   }
//   //   _openAction = false;
//   //   return true;
//   // }
//
//   bool _openAction = false;
//
//   Future openScan(BuildContext context) async {
//     // if (false == await permission()) {
//     //   return;
//     // }
//
//     setState(() {
//       _showScanView = true;
//     });
//   }
//
//   Future startScan() async {
//     assert(_controller != null);
//     _controller?.startCamera((String result, _) async {
//       await stopScan();
//       showDialog(
//         context: scaffoldKey.currentContext!,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('扫码结果'),
//             content: Text(result),
//           ).build(context);
//         },
//       );
//     });
//   }
//
//   Future stopScan() async {
//     assert(_controller != null);
//     await _controller?.stopCamera();
//     setState(() {
//       _showScanView = false;
//     });
//   }
//
//   Future flashlight() async {
//     assert(_controller != null);
//     final state = await _controller?.setFlashlight();
//     setState(() {
//       _flashlightState = state ?? false;
//     });
//   }
//
//   // Future imgScan() async {
//   //   var image = await ImagePicker().getImage(source: ImageSource.gallery);
//   //   if (image == null) return;
//   //   final rest = await FlutterQrReader.imgScan(image.path);
//   //
//   //   showDialog(
//   //     context: scaffoldKey.currentContext!,
//   //     builder: (context) {
//   //       return AlertDialog(
//   //         title: Text('扫码结果'),
//   //         content: Text(rest),
//   //       ).build(context);
//   //     },
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         key: scaffoldKey,
//         appBar: AppBar(
//           title: const Text('二维码扫描演示'),
//         ),
//         body: Builder(builder: (context) {
//           return Column(
//             children: [
//               TextButton(onPressed: () => openScanUI(context), child: Text('打开扫描界面')),
//               // TextButton(
//               //   onPressed: imgScan,
//               //   child: Text("识别图片"),
//               // ),
//               Container(
//                 height: 1,
//                 margin: EdgeInsets.symmetric(vertical: 12),
//                 color: Colors.black12,
//               ),
//               _showScanView == false ? TextButton(onPressed: () => openScan(context), child: Text('启动扫描视图')) : Text('扫描视图已经启动'),
//               TextButton(onPressed: flashlight, child: Text(_flashlightState == false ? '打开手电筒' : '关闭手电筒')),
//               Container(
//                 height: 12,
//                 color: Colors.black12,
//               ),
//               _showScanView == true
//                   ? Container(
//                 width: 320,
//                 height: 350,
//                 child: QrReaderView(
//                   width: 320,
//                   height: 350,
//                   callback: (container) {
//                     this._controller = container;
//                     this.startScan();
//                   },
//                 ),
//               )
//                   : Container()
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }

//
//
// void main() => runApp(
//   Airoute.createMaterialApp(
//     home: App(),
//     routes: <String, WidgetBuilder>{
//       "/SelectScannerStylePage": (_) => SelectScannerStylePage(),
//       "/CustomSizeScannerPage": (_) => CustomSizeScannerPage(),
//       "/FullScreenScannerPage": (_) => FullScreenScannerPage(),
//       "/TaskNextPage": (_) => TaskNextPage(),
//       "/CreatorPage": (_) => CreatorPage(),
//       "/TestingPage": (_) => TestingPage(),
//     },
//   ),
// // );

// ///
// /// App
// class AIBarCODE extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _AIBarCODEState();
//   }
// }
//
// ///
// /// _AppState
// class _AIBarCODEState extends State<AIBarCODE> {
//   ScannerController _scannerController =
//       ScannerController(scannerResult: (String result) {
//     print(result);
//   });
//   bool isCameraPause = false;
//   initialCamera() async {
//     _scannerController.startCamera();
//     // await _scannerController.startCameraPreview();
//     //  _scannerController.closeFlash();
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initialCamera();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR code"),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               flex: 1,
//               child: Stack(children: [
//                 Container(
//                   color: Colors.black26,
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.width,
//                   child: PlatformAiBarcodeScannerWidget(
//                     platformScannerController: _scannerController,
//                   ),
//                 ),
//                 _cameraButtons(),
//               ]),
//             ),
//             // Expanded(flex: 1,
//             //   child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       children: [
//             //         MaterialButton(
//             //           onPressed: () {
//             //             //跳转页面=生成二维码
//             //             // Airoute.pushNamed(
//             //             //   routeName: "/CreatorPage",
//             //             // );
//             //           },
//             //           textColor: Colors.white,
//             //           color: Colors.blue,
//             //           child: Text("Create QR code"),
//             //         ),
//             //       ],
//             //     ),
//             //
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _cameraButtons() {
//     return Positioned(
//         top: 2,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               margin: EdgeInsets.all(8),
//               child: IconButton(
//                 onPressed: () async {
//                   if (_scannerController.isStartCameraPreview) {
//                     print('Camera Paused');
//                     await _scannerController.stopCameraPreview();
//                   } else {
//                     print('Camera Resumed');
//                     await _scannerController.startCameraPreview();
//                   }
//                   setState(() {
//                     isCameraPause = !isCameraPause;
//                   });
//                   // // print(listData);
//                 },
//                 icon: Icon(
//                   isCameraPause
//                       ? Icons.pause_circle_outline
//                       : Icons.play_circle_outline,
//                   color: Colors.white60,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.all(8),
//               child: IconButton(
//                 onPressed: () async {
//                   await _scannerController.toggleFlash();
//                   // setState(() {});
//                 },
//                 icon: Icon(
//                   Icons.flash_on,
//                   color: Colors.white60,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.all(8),
//               child: IconButton(
//                   onPressed: () async {
//                     if (_scannerController.isStartCamera) {
//                       await _scannerController.stopCamera();
//                       print('stopped');
//                     } else {
//                       await _scannerController.startCamera();
//                       print('started');
//                     }
//                     setState(() {});
//                   },
//                   icon: Icon(
//                     Icons.stop_circle_outlined,
//                     color: Colors.white60,
//                   )),
//             )
//           ],
//         ));
//   }
// }
