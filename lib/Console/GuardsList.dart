import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:http/http.dart' as http;
import '../Contsants/Data.dart';
import '../Contsants/app.dart';
import '../Contsants/decorations.dart';
import '../Contsants/pinCode.dart';
import '../Databases/Boxes/Boxes.dart';
import 'Authentications/JWT.dart';

class Guards extends StatefulWidget {
  @override
  _GuardsState createState() => _GuardsState();
}

class _GuardsState extends State<Guards> {
  String? token;
  bool? _isOrientationInside = true;
  String? _orientationFiltered = 'IN';
  @override
  void initState() {
    // 
    super.initState();
    if (Boxes.instance.consoleAuthBox.isNotEmpty) {
      token =
          jsonDecode(Boxes.instance.consoleAuthBox.get(Boxes.ConsoleAuthKey))[
              'account'][0]['token'];
    }
  }

  double? _width, _textScale;
  TextStyle? valueStyle, expansionChildHeadingStyle, expansionHeadingStyle;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    valueStyle = NeumorphicTheme.currentTheme(context).textTheme.subtitle2;
    expansionChildHeadingStyle =
        NeumorphicTheme.currentTheme(context).textTheme.subtitle1;
    expansionHeadingStyle =
        NeumorphicTheme.currentTheme(context).textTheme.headline6;
    _textScale = _width! >= 500 ? 1.1 : 0.7;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${Boxes.instance.currentCompanyBox.get(Boxes.CurrentCompanyKey)[1]}s Guards",
                style:
                    NeumorphicTheme.currentTheme(context).appBarTheme.textStyle,
              ),
              SizedBox(
                width: 15,
              )
            ],
          )
        ],
      ),
      body: Container(
        width: _width! > 598 ? 400 : _width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: token != null
            ? FutureBuilder<List<GuardModel>?>(
                future: fetchGuardList(token),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          padding: EdgeInsets.only(bottom: 70),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var currentGuard = snapshot.data![index];
                            return _userListTile(currentGuard, index);
                          });
                    } else if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text('Waiting connection..')
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })
            : Text(
                'Token value is null in initiate() override method',
                style: TextStyle(color: Colors.red),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => App.alertBox(context,
            widget: ScannerToken(context), scrollable: true),
        // foregroundColor: Colors.transparent,
        backgroundColor: NeumorphicTheme.currentTheme(context).accentColor,
        child: Icon(
          Icons.add,
          color: NeumorphicTheme.currentTheme(context)
              .appBarTheme
              .iconTheme!
              .color,
        ),
      ),
      bottomNavigationBar: _navigationBar(),
    );
  }

  Widget _userListTile(GuardModel currentGuard, index) {
    return Neumorphic(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      style: NeumorphicStyle(depth: 3),
      child: ExpansionTile(
          leading: Text(
            (index + 1).toString(),
            overflow: TextOverflow.ellipsis,
            textScaleFactor: _textScale,
            textWidthBasis: TextWidthBasis.longestLine,
            style: expansionHeadingStyle,
          ),
          title: Text(
            currentGuard.name!,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            textScaleFactor: _textScale,
            textWidthBasis: TextWidthBasis.longestLine,
            style: expansionHeadingStyle,
          ),
          subtitle: Row(
            children: [
              Text(
                currentGuard.loc!,
                textScaleFactor: _textScale,
                style: valueStyle,
              ),
              Spacer(),
              App.button(
                  onPressed: () {
                    // UserModel? _data = data[position];
                    print('Coming soon...');
                  },
                  toolTip: 'history',
                  icon: Icons.history_rounded),
            ],
          ),
          children: [
            Divider(
              color: Colors.black.withOpacity(0.2),
              height: 9,
              thickness: 0.2,
            ),
            App.tileText(context,
                heading: 'Orientation', value: currentGuard.orientation),
            App.tileText(context, heading: 'PIN', value: currentGuard.pin),
            App.tileText(context,
                heading: 'Company Id',
                value: currentGuard.companyId.toString()),
            App.tileText(context,
                heading: 'Guard Id', value: currentGuard.id.toString()),
            App.tileText(context, heading: 'Token', value: currentGuard.token),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async => await delete(currentGuard),
                  icon: Icon(Icons.delete),
                )
              ],
            )
          ],
          tilePadding: EdgeInsets.all(3),
          childrenPadding:
              EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 28),
          expandedAlignment: Alignment.centerLeft),
    );
  }

  Widget _navigationBar() {
    return Container(
      height: 55,
      color: NeumorphicTheme.currentTheme(context).accentColor,
      child: Row(
        children: [
          Spacer(),
          App.buttonIOS(context,
              color: _isOrientationInside!
                  ? Colors.white30
                  : Colors.transparent, onPressed: () {
            setState(() {
              _orientationFiltered = 'IN';
              _isOrientationInside = true;
            });
          }, text: '            IN            '),
          Spacer(),
          App.buttonIOS(context,
              color: _isOrientationInside!
                  ? Colors.transparent
                  : Colors.white30, onPressed: () {
            setState(() {
              _orientationFiltered = 'OUT';
              _isOrientationInside = false;
            });
          }, text: '            OUT            '),
          Spacer(),
        ],
      ),
    );
  }

  Future delete(GuardModel currentGuard) async {
    var _dataEncode = JWT.encodeJWT({
      'id': currentGuard.id,
      'token':
          jsonDecode(Boxes.instance.consoleAuthBox.get(Boxes.ConsoleAuthKey))[
              'account'][0]['token'],
      'type': 'guard'
    });
    var res = await http.post(
        Uri.parse('http://$androidLocalHost:8080/delete/from'),
        body: {'data': _dataEncode});
    print(res.statusCode);
    if (res.statusCode == 200) {
      setState(() {});
    } else {
      App.snackBar(context,
          text: "Couldn't deleted", color: Colors.red, textColor: Colors.white);
    }
  }

  Future<List<GuardModel>> fetchGuardList(token) async {
    List? data;
    List? filteredList = [];
    try {
      var res = await http.get(
        Uri.parse('http://$androidLocalHost:8080/get/guards/$token'),
      ); // var a=jsonEncode(res.body);
      data = jsonDecode(res.body);
      for (var guard in data!) {
        if (guard['orientation'] == _orientationFiltered &&
            guard['companyId'] ==
                Boxes.instance.currentCompanyBox
                    .get(Boxes.CurrentCompanyKey)[0]) {
          filteredList.add(guard);
        }
      }

      ///Connection available
      ///
      print('isConnectionAvailable = true;');
    } on SocketException {
      ///Connection not  available
      ///
      /// print('isConnectionAvailable = false;');
      ///
      print('No Internet connection 😑');

      /// show error in text field  after 4 seconds while have connection error
      /// Timer(Duration(seconds: 4), () {
      ///   setState(() {
      ///     isErrorShowOnConnectionTimeOut = true;
      ///   });
      /// });
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    }
    return filteredList.map((guards) => GuardModel.fromJson(guards)).toList();
  }
}

///Create Token
class ScannerToken extends StatefulWidget {
  final BuildContext context;
  ScannerToken(this.context);
  @override
  _ScannerTokenState createState() => _ScannerTokenState();
}

class _ScannerTokenState extends State<ScannerToken> {
  var _name, _loc, _orientation, _pin;
  List _orientationList = ['IN', 'OUT'];
  final _formKey = GlobalKey<FormState>();
  bool? isErrorShow = false;
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

  Future _post() async {
    _auth() {
      var _json;
      if (Boxes.instance.consoleAuthBox.isOpen) {
        if (Boxes.instance.consoleAuthBox.isNotEmpty) {
          var _d = Boxes.instance.consoleAuthBox.get(Boxes.ConsoleAuthKey);
          var _c = jsonDecode(_d)['account'][0]['token'];
          print('token:$_c');
          _json = {
            'companyId': Boxes.instance.currentCompanyBox
                .get(Boxes.CurrentCompanyKey)[0],
            'token': _c,
          };
          print('json:$_json');
        }
      }
      var _a = JWT.encodeJWT(_json);
      print(_a);
      return _a;
    }

    var contents = {
      "name": _name,
      "loc": _loc,
      "orientation": _orientation,
      "pin": _pin,
      "authenticationToken": _auth(),
    };
    var encodedJWTScannerCredentials = JWT.encodeJWT(contents);

    var res = await http.post(
      Uri.parse("http://$androidLocalHost:8080/scanner/generate/api"),
      body: {"token": encodedJWTScannerCredentials},
    );

    if (res.statusCode == 200) {
      Clipboard.setData(new ClipboardData(text: encodedJWTScannerCredentials));
      App.snackBar(context, text: 'Token Copied To ClipBoard', seconds: 2);
      return 200;
    } else {
      return 409;
    }
  }

  var _width;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 40),
      child: Center(
        child: Container(
          width: _width > 500 ? 500 : _width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextField(
                  hintText: 'Name',
                  keyboardType: TextInputType.text,
                  // controller: nameController,
                  form: AppTextField.enable,
                  onChange: (a) {
                    setState(() {
                      _name = a;
                    });
                  },
                  validator: (a) {
                    setState(() {});
                  },
                ),
                AppTextField(
                  hintText: 'Place Name',
                  keyboardType: TextInputType.text,
                  // controller: nameController,
                  form: AppTextField.enable,
                  onChange: (a) {
                    setState(() {
                      _loc = a;
                    });
                  },
                  validator: (a) {
                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(),
                      Text(
                        'Select Check-Point Orientation',
                        style: TextStyle(
                          fontSize: _width > 598.0 ? 18 : 16,
                          color: NeumorphicTheme.currentTheme(context)
                              .textTheme
                              .bodyText1!
                              .color,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      addRadioButton(0, 'IN'),
                      addRadioButton(1, 'OUT'),
                      Divider(),
                    ],
                  ),
                ),
                Pin(
                  onChange: (a) {
                    setState(() {
                      _pin = a;
                    });
                  },
                  controller: _pinController!,
                ),
                App.buttonIOS(context, onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _post().then((status) {
                      if (status == 200) {
                        Navigator.pop(context);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Guards()));
                      } else if (status == 409) {
                        setState(() {
                          isErrorShow = true;
                        });
                      }
                    });
                  }
                },
                    text: 'Generate',
                    color: NeumorphicTheme.currentTheme(context)
                        .buttonStyle!
                        .color),
                isErrorShow! ? errorShow() : Container(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget errorShow(
      {double width = 60 * 5,
      double height = 41,
      double leftRadius = 4,
      double rightRadius = 4}) {
    return Container(
      margin: EdgeInsets.all(20),
      width: width,
      height: height,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.8),
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(leftRadius),
            right: Radius.circular(rightRadius)),
      ),
      child: Row(
        children: [
          Text(
            'Check Your Internet Connection',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Spacer(),
          // IconButton(
          //   onPressed: () {
          //     widget.controller!.clear();
          //   },
          //   icon: Icon(
          //     Icons.close,
          //     color: Colors.white,
          //     size: 17,
          //   ),
          // )
        ],
      ),
    );
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            child: Radio(
          activeColor: NeumorphicTheme.accentColor(context),
          value: _orientationList[btnValue],
          groupValue: _orientation,
          onChanged: (dynamic value) {
            setState(() {
              _orientation = value;
              print(_orientation);
            });
          },
        )),
        Text(
          title,
          style: TextStyle(
              fontSize: _width > 598.0 ? 16 : 14,
              color: NeumorphicTheme.currentTheme(context)
                  .textTheme
                  .bodyText1!
                  .color),
        )
      ],
    );
  }

  @override
  void dispose() {
    // : implement dispose
    super.dispose();
    _pinController!.dispose();
  }
}

class GuardModel {
  final int? id;
  final int? companyId;
  final String? name;
  final String? orientation;
  final String? pin;
  final String? token;
  final String? loc;

  GuardModel(
      {this.id,
      this.name,
      this.companyId,
      this.token,
      this.loc,
      this.pin,
      this.orientation});

  factory GuardModel.fromJson(Map<String, dynamic> json) {
    return GuardModel(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      name: json['name'] as String,
      orientation: json['orientation'] as String,
      pin: json['pin'] as String,
      token: json['token'] as String,
      loc: json['loc'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'name': name,
      'orientation': orientation,
      'pin': pin,
      'token': token,
      'loc': loc,
    };
  }
}
