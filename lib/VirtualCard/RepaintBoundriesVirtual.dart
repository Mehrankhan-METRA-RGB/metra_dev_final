import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Console/CreateAndSave/PDF.dart';
import '../Console/Editor/Card.dart';
import '../Contsants/app.dart';
import '../Databases/Boxes/Boxes.dart';
import '../Models/Models.dart';
class VirtualRepaintCard extends StatefulWidget {

  // static var imgFrontSideCard;
  // static var imgBackSideCard;
  final name;
  final CardCredentials? user;
  VirtualRepaintCard({this.name, this.user});
  @override
  _VirtualRepaintCardState createState() => _VirtualRepaintCardState();
}

class _VirtualRepaintCardState extends State<VirtualRepaintCard> {

  var _width;
   GlobalKey _cardFrontSideBoundsKey = new GlobalKey();
   GlobalKey _cardBackSideBoundsKey = new GlobalKey();
  CardModel? _cardDecoration;
  CardCredentials? _user;


  @override
  void initState() {
    // : implement initState
    super.initState();
    if (Boxes.instance.activatedCardBox.isNotEmpty) {
      ///get Card with a specific key

      _cardDecoration = widget.user!.decoration;

      _user = widget.user;
    }
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    // print(_width);
    return Scaffold(
        appBar: AppBar(title: Text('${widget.name}'),),
        body: Boxes.instance.localVirtualCardBox.isEmpty
            ? Container(
          width: _width,
          alignment: Alignment.center,
          child:  Text('Card has not been saved in a Local storage'),

        )
            : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: _width,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Front',
                  style: TextStyle(fontSize: 20),
                ),
                // AppDefault.imgFrontSideCard==AppDefault.imgFrontSideCard?Container():
                RepaintBoundary(
                    key: _cardFrontSideBoundsKey,
                    child: AppCard(
                        isEditable: false,
                        decoration: _cardDecoration,
                        userData: _user,
                        sizeRatio: _width > 590.0 ? 2.1 : 1.1,
                        activeSide: AppCard.front)),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Back',
                  style: TextStyle(fontSize: 20),
                ),

                RepaintBoundary(
                    key:_cardBackSideBoundsKey,
                    child: AppCard(
                        isEditable: false,
                        decoration: _cardDecoration,
                        userData: _user,
                        sizeRatio: _width > 590.0 ? 2.1 : 1.1,
                        activeSide: AppCard.back)),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _singleCardBottomNavigation(context));
  }

  _singleCardBottomNavigation(BuildContext context, {double? height = 55}) {


    return Container(
      width: _width,
      height: height,
      color: NeumorphicTheme.accentColor(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(),
      App.buttonIOS(context,
color: Colors.white38,
              text: 'Save as PDF',
              onPressed: ()async {
                Uint8List? back;
                Uint8List? front;
                ///Getting data from [capturePng] Asynchronously
                ///And assign to Synchronous a variables [front,back]
                ///then generate PDF
                capturePng(
                  cardSideKey: _cardFrontSideBoundsKey,
                ).then((value) => front=value).whenComplete(() =>  capturePng(
                  cardSideKey: _cardBackSideBoundsKey,
                ).then((value) => back=value)).whenComplete(() async=>await PDF.generateSinglePDF(context: context,
                  frontImage:front,backImage:back,name:widget.name,  ));



                // print('Adding Card to List....');

              }),
        ],
      ),
    );
  }

  Future<Uint8List?> capturePng({required cardSideKey})async  {
    RenderRepaintBoundary boundary =
    cardSideKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage(pixelRatio: 3);
    ByteData byteData = ( await image.toByteData(format: ImageByteFormat.png))!;
    return byteData.buffer.asUint8List();
  }



}


