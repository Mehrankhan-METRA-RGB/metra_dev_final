import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:metra_dev/Databases/Boxes/Boxes.dart';
import 'package:metra_dev/Models/Models.dart';
import '../Console/Authentications/JWT.dart';
import '../Console/Editor/Card.dart';
import '../Contsants/Data.dart';
import '../Contsants/app.dart';
import '../Contsants/pinCode.dart';
import '../metra_startpage.dart';
import 'RepaintBoundriesVirtual.dart';

class VirtualCard extends StatefulWidget {
  @override
  _VirtualCardState createState() => _VirtualCardState();
}

class _VirtualCardState extends State<VirtualCard> {
  bool? isCardAvailable;
  // ignore: unused_field
  var _width;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (Boxes.instance.localVirtualCardBox.isNotEmpty) {
      isCardAvailable = true;
    } else {
      isCardAvailable = false;
    }
  }

  @override
  dispose() {
    /// when I leave the page, put it back to normal like this:
    ///
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    // _height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: isCardAvailable! ? _Card() : _Login(),
    );
  }
}


///VIRTUAL CARD Widget
///
class _Card extends StatefulWidget {
  @override
  __CardState createState() => __CardState();
}

class __CardState extends State<_Card> {
  GlobalKey<FlipCardState> flipVCardKey = GlobalKey();
  bool? isSwipeUp = true;
  CardCredentials? user;
  final getCardFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (Boxes.instance.localVirtualCardBox.isNotEmpty) {
      ///Decode All JSON --> [{"decoration":{CardCredentials}}]
      var decode = jsonDecode(Boxes.instance.localVirtualCardBox
          .get(Boxes.localVirtualCardKey))[0]['decoration'];

      ///Decode sub JSON --> [{CardCredentials}]
      var decodeDecoration = jsonDecode(decode);
      user = CardCredentials.fromJson(decodeDecoration);
    }
  }

  @override
  dispose() {
    /// when I leave the page, put it back to normal like this:
    ///

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: _drawer(context),
      body: Center(
        child: GestureDetector(
          onVerticalDragEnd: (drag) {
            if (isSwipeUp!) {
              if ((drag.primaryVelocity)! > 100) {
                flipVCardKey.currentState!.toggleCard();
                setState(() {
                  isSwipeUp = !isSwipeUp!;
                });
              }
            } else {
              if ((drag.velocity.pixelsPerSecond.dy) < -100) {
                flipVCardKey.currentState!.toggleCard();
                setState(() {
                  isSwipeUp = !isSwipeUp!;
                });
              }
            }
          },
          child: RotatedBox(
            quarterTurns: 1,
            child: FlipCard(
              key: flipVCardKey,
              flipOnTouch: true,
              front: AppCard(
                isEditable: false,
                userData: user,
                decoration: user!.decoration,
                sizeRatio: 1.9,
                activeSide: AppCard.front,
              ),
              back: AppCard(
                isEditable: false,
                userData: user,
                decoration: user!.decoration,
                sizeRatio: 1.9,
                activeSide: AppCard.back,
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget  _drawer(BuildContext context){
    return App.drawer(context,actions:
    [

      IconButton(
      onPressed: ()
    {
      var data=Boxes.instance.localVirtualCardBox.get(Boxes.localVirtualCardKey);

CardCredentials? credentials=CardCredentials.fromJson(jsonDecode(jsonDecode(data)[0]['decoration']));
      print(credentials.lv1!.value);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VirtualRepaintCard(
                user: credentials,
                name:'${credentials.lv1!.value}s Card')),
      );
      },

      icon: Icon(
        Icons.picture_as_pdf,
        color: NeumorphicTheme.currentTheme(context)
            .appBarTheme
            .iconTheme!
            .color,
      ),
      tooltip: 'Create PDF'
      ,
    ),
      Spacer(),
      IconButton(
        onPressed: ()
        {

          App.alertBox(context,title:'Card Holder',widget: _moreInfo(context),
          );
        },

        icon: Icon(
          Icons.more_horiz_outlined,
          color: NeumorphicTheme.currentTheme(context)
              .appBarTheme
              .iconTheme!
              .color,
        ),
        tooltip: 'More Information'
        ,
      ),
    ]);
  }

  Widget _moreInfo(BuildContext context){
    var data=Boxes.instance.localVirtualCardBox.get(Boxes.localVirtualCardKey);
    CardCredentials? credentials=CardCredentials.fromJson(jsonDecode(jsonDecode(data)[0]['decoration']));
    return Container(width: MediaQuery.of(context).size.width/2,
      color: NeumorphicTheme.baseColor(context),
      height: 150,
      padding: EdgeInsets.all(15),
      child: Column(children: [
App.tileText(context,
    textScale:1.3,
    heading: ' ',
    value: 'The Card holder named ${credentials.lv1!.value} has registered with ${credentials.company!.companyName} genuinely.'
      'He/She  play role as ${credentials.lv2!.value} in ${credentials.company!.companyName}.')
      ],),
    );
  }
}

///LOGIN Widget
class _Login extends StatefulWidget {
  @override
  __LoginState createState() => __LoginState();
}

class __LoginState extends State<_Login> {
  GlobalKey<FlipCardState> flipVCardKey = GlobalKey();
  var _width;
  TextEditingController? _authenticationController;
  TextEditingController _pinController = TextEditingController();

  final getCardFormKey = GlobalKey<FormState>();

  @override
  dispose() {
    /// when I leave the page, put it back to normal like this:
    ///
    _authenticationController!.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _authenticationController = TextEditingController();
    _pinController.addListener(() {
      setState(() {});
    });
    _authenticationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width >= 500 ? 500 : _width - 20,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: _form(),
      ),
    );
  }
Widget _form(){return Form(
  key: getCardFormKey,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextFormField(
        keyboardType: TextInputType.url,
        maxLines: 5,
        controller: _authenticationController!,
        decoration: InputDecoration(
          hintText: 'Authentication Code...',
          helperText: 'Authentication and PIN code will be provided by Company Please check Email ',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          hintStyle: new TextStyle(
            color: NeumorphicTheme.currentTheme(context)
                .textTheme
                .bodyText1!
                .color,
          ),
          labelStyle: new TextStyle(
            color: NeumorphicTheme.currentTheme(context)
                .textTheme
                .bodyText1!
                .color,
          ),
        ),
        validator: (a){
          if(a!.length<1){
            return 'Please paste your authentication';
          }else{ return null;}

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
            controller: _pinController,
            onChange: (a) {},
          ),
        ],
      ),
      App.buttonIOS(context, onPressed: () async {
        var _decodedPin = jsonDecode(
            JWT.decodeJWT(_authenticationController!.text))['pin'];

        if (_decodedPin.toString() == _pinController.text) {
          if (getCardFormKey.currentState!.validate()) {
            await _fetch(_authenticationController!.text).then(
                  (res) => res == 200
                  ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppStartPage(
                          route: Boxes.instance.mainRouteBox
                              .get(Boxes.MainRouteKey))))
                  : App.snackBar(
                context,
                text: 'Login error',
                color: Colors.red,
                textColor: Colors.white70,
              ),
            );
          }
        } else {
          App.snackBar(context,
              text: 'INCORRECT PIN',
              color: Colors.red,
              textColor: Colors.white);
        }
      },
          text: '   Load Card  ',
          color:
          NeumorphicTheme.currentTheme(context).buttonStyle!.color),
      SizedBox(height: 20,),
      App.buttonIOS(context, onPressed: () =>_pasteFromClipboard(),
        text: '   Past clipBoard data',
        color: NeumorphicTheme.currentTheme(context).buttonStyle!.color!.withOpacity(0.09),
      )


    ],
  ),
);}
 void _pasteFromClipboard() async {
    String? _lastCopied;
    Future<ClipboardData?> clipboard = Clipboard.getData('text/plain');
    bool? isClipBoardEmpty;
    clipboard
        .then((value) => value!.text!.isEmpty
            ? isClipBoardEmpty = false
            : isClipBoardEmpty = true)
        .whenComplete(() {
      print(isClipBoardEmpty!);
      if (isClipBoardEmpty!) {
        clipboard.then((value) {
          _lastCopied = value!.text;
          print(value.text);
        }).whenComplete(() {
          var decode = jsonDecode(_lastCopied!);
          print(decode['Token']);
          setState(() {
            ///Assign values to Controllers
            _authenticationController!.text = decode['Token'].toString();
            _pinController.text = decode['PIN'].toString();
          });
        });
      } else {
        App.snackBar(context,
            text: 'No Text Data in ClipBoard',
            color: Colors.red,
            textColor: Colors.white);
      }
    });

    // print(_lastCopied);
  }

  Future _fetch(token) async {
    http.Response? res;
    try {
      res = await http.get(
        Uri.parse('http://$androidLocalHost:8080/card/virtual/user/$token'),
      );

      ///Connection available
    } on SocketException {
      ///Connection not  available
      print('No Internet connection 😑');
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    }
    print('Status: ${res!.statusCode}');
    if (res.statusCode == 200) {
      print(res.body);
      ///Save Response data in local storage
      if (Boxes.instance.localVirtualCardBox.isOpen) {
        Boxes.instance.localVirtualCardBox
            .put(Boxes.localVirtualCardKey, res.body);
      } else {
        throw ('BOX:[localVirtualCardBox] is not opened');
      }
      if (Boxes.instance.virtualCardAuthBox.isOpen) {
        Boxes.instance.virtualCardAuthBox.put(Boxes.VirtualCardAuthKey, token);
      } else {
        throw ('Hive Box [virtualCardAuthBox] is not opened');
      }

      print('Uploaded');
    } else {
      print('The Card has not currently being Generated by company');
      App.snackBar(context,text:'The Card has not currently being Generated by company',color: Colors.red,textColor: Colors.white,seconds: 4);
    }
    return res.statusCode;
  }
}
