import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'dart:async';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Console/Authentications/JWT.dart';
import '../Console/UserList.dart';
import '../Contsants/Data.dart';
import '../Contsants/app.dart';
import '../Contsants/decorations.dart';
import '../Contsants/pinCode.dart';
import '../Databases/Boxes/Boxes.dart';
import '../metra_startpage.dart';

class TestLogin extends StatefulWidget {
  static var auth = 'l';
  @override
  _TestLoginState createState() => _TestLoginState();
}

class _TestLoginState extends State<TestLogin> {
  var _auth, _pin;
  Stream<FileResponse>? fileStream;

  // List _orientationList = ['IN', 'OUT'];
  final _formKey = GlobalKey<FormState>();
  var _width, _height;
  TextEditingController? _pinController;

  @override
  void initState() {
    // : implement initState
    super.initState();
    _pinController = new TextEditingController();
    _pinController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView.builder(
      //       itemCount: urlList!.length,
      //       itemBuilder: (context, index) {
      //         return StreamBuilder<FileResponse?>(
      //             stream: _getImageFromCacheMemory(index),
      //             builder: (context, snapshot) {
      //               FileInfo fileInfo = snapshot.data as FileInfo;
      //               return Image.file(
      //                 fileInfo.file,
      //                 width: 20,
      //                 height: 20,
      //               );
      //             });
      //       }),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        child: Container(
          // alignment: Alignment.center,
          height: _height,
          width: _width > 500 ? 500 : _width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                AppTextField(
                  hintText: 'Authentication Token',
                  keyboardType: TextInputType.text,
                  form: AppTextField.enable,
                  onChange: (a) {
                    setState(() {
                      _auth = a;
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Pin Code',
                      style: NeumorphicTheme.currentTheme(context)
                          .textTheme
                          .headline5,
                    ),
                    Pin(
                      controller: _pinController!,
                      onChange: (a) {
                        setState(() {
                          _pin = a;
                        });
                      },
                    ),
                  ],
                ),
                App.buttonIOS(context, onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _fetch().whenComplete(
                      () => Boxes.instance.scannerAuthBox.isNotEmpty
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppStartPage(
                                      route: Boxes.instance.mainRouteBox
                                          .get(Boxes.MainRouteKey))))
                          : App.snackBar(context,
                              text: 'INCORRECT PIN',
                              color: Colors.red,
                              textColor: Colors.white70),
                    );
                  }
                },
                    text: '   Load   ',
                    color: NeumorphicTheme.currentTheme(context)
                        .buttonStyle!
                        .color),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<UserModel>?> _fetch() async {
    var decodeAuth = JWT.decodeJWT(_auth);
    var json = jsonDecode(decodeAuth);
    var authPin = json['pin'];
    print('pin:$authPin');

    ///Validate Token through PIN
    if (authPin.toString() == _pin.toString()) {
      var res = await http.get(
        Uri.parse("http://$androidLocalHost:8080/scanner/fetch/api/$_auth"),
      );

      if (res.statusCode == 200) {
        List decode = jsonDecode(res.body);

        List? _encodedListUsersData = [];
        decode.forEach((user) {
          _encodedListUsersData.add(jsonEncode(user));

          ///save every image in cache memory in background
          UserModel _user = UserModel.fromJson(user);
          var _url = '$urlHeader${_user.imageUrl}'.replaceAll('\\', '/');
          _saveInCache(url: _url);
        });
        // print(decode);

        ///if scannerFetchedDataBox already contain data then update that data
        if (Boxes.instance.scannerFetchedDataBox.isNotEmpty) {
          print('updating...');
          Boxes.instance.scannerFetchedDataBox
              .deleteFromDisk()
              .then((value) async =>
                  await Hive.openBox(Boxes.scannerFetchedDataKey))
              .then((value) async => await Boxes.instance.scannerFetchedDataBox
                  .addAll(_encodedListUsersData));
          print('updated');
        } else if (Boxes.instance.scannerFetchedDataBox.isEmpty) {
          print('adding...');

          await Boxes.instance.scannerFetchedDataBox
              .addAll(_encodedListUsersData);

          print('added');
        }

        /// if scannerAuthBox already  contain encodedJWTScannerCredentials then update that encodedJWTScannerCredentials
        if (Boxes.instance.scannerAuthBox.isNotEmpty) {
          print('updating Auth...');
          Boxes.instance.scannerAuthBox
              .deleteFromDisk()
              .whenComplete(
                  () async => await Hive.openBox(Boxes.ScannerAuthKey))
              .whenComplete(() async => await Boxes.instance.scannerAuthBox
                  .put(Boxes.ScannerAuthKey, _auth));
          print(' Auth... updated');
        } else {
          print(' Adding Auth...');
          await Boxes.instance.scannerAuthBox.put(Boxes.ScannerAuthKey, _auth);
          print(' Auth... Added');
        }
        // _route();
        return decode.map((user) => UserModel.fromJson(user)).toList();
      }
    } else {
      return null;
    }
  }





  // Stream<FileResponse>? _getImageFromCacheMemory(int? index) {
  //   List<Stream<FileResponse>>? _data = [];
  //   Stream<FileResponse>? fileStream;
  //   urlList!.forEach((element) {
  //     fileStream = DefaultCacheManager().getFileStream(element);
  //     _data.add(fileStream!);
  //   });
  //   return _data[index!];
  // }


  void _saveInCache({url}) {
    setState(() {
      fileStream = DefaultCacheManager().getImageFile(
        url,
        maxHeight: 50,
        maxWidth: 50,
      );
    });
    print('$url Downloaded');
  }

  // ignore: unused_element
  void _removeFile({url}) {
    DefaultCacheManager().removeFile(url).then((value) {
      print('File removed');
    }).onError((error, stackTrace) {
      print(error);
    });
    setState(() {
      fileStream = null;
    });
  }

  @override
  void dispose() {
    // : implement dispose
    super.dispose();
    _pinController!.dispose();
  }
}
