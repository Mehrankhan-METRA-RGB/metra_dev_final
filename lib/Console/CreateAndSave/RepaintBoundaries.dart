import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../Contsants/Data.dart';
import '../../Contsants/app.dart';
import '../../Databases/Boxes/Boxes.dart';
import '../../Models/Models.dart';
import '../CardDesigns.dart';
import '../Editor/Card.dart';
import '../Editor/CardMethods.dart';
import 'PDF.dart';
import 'multiCardsMethods.dart';

class RepaintCard extends StatefulWidget {
  static GlobalKey frontScreenSnap = new GlobalKey();
  static GlobalKey backScreenSnap = new GlobalKey();
  // static var imgFrontSideCard;
  // static var imgBackSideCard;
  final name;
  final CardCredentials? user;
  RepaintCard({this.name, this.user});
  @override
  _RepaintCardState createState() => _RepaintCardState();
}

class _RepaintCardState extends State<RepaintCard> {
  // var cardbox = Hive.box<SaveCardsLocal>('saveCardsLocal');
  var _width;

  CardModel? _cardDecoration;
  CardCredentials? _user;

  ///Key:will be any number

  @override
  void initState() {
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
        appBar: AppBar(),
        body: Boxes.instance.activatedCardBox.isEmpty
            ? Container(
                width: _width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Select Your Preferred Card Design '),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CardDesigns(
                                      size: 1.3,
                                      onChange: (a) {
                                        setState(() {});
                                      },
                                    )),
                          );
                        },
                        child: Text('Select Design'))
                  ],
                ),
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
                          key: RepaintCard.frontScreenSnap,
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
                          key: RepaintCard.backScreenSnap,
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
        bottomNavigationBar: _multiCardsBottomNavigation(context));
  }

  _multiCardsBottomNavigation(BuildContext context, {double? height = 55}) {
    TextStyle? _style = TextStyle(
        fontSize: _width >= 500 ? 16 : 13,
        fontFamily: AppFonts.almaraiLight,
        color: NeumorphicTheme.currentTheme(context)
            .appBarTheme
            .textStyle!
            .color!);
    _button({void Function()? onTap, String? text}) => MaterialButton(
          onPressed: onTap,
          hoverColor:
              NeumorphicTheme.currentTheme(context).baseColor.withOpacity(0.3),
          child: Container(
              width: _width / 3,
              height: height,
              alignment: Alignment.center,
              child: Text(
                text!,
                style: _style,
              )),
        );
    return Container(
      width: _width,
      height: height,
      color: NeumorphicTheme.currentTheme(context).appBarTheme.color,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _button(
              text: 'Change Design',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardDesigns(
                              // credentials: widget.user,
                          size: 0.8,
                              onChange: (a) {
                                setState(() {});
                              },
                            )));
              }),
          _button(
              text: 'Add ',
              onTap: () {
                // print('Adding Card to List....');
                _addCardToList(context);
              }),
        ],
      ),
    );
  }



 void  _addCardToList(BuildContext context) async {
    Uint8List? _front;
    Uint8List? _back;
   ///When space available in A4 Page
    if(Boxes.instance.bytePNGCardsBox.length<10){
      ///capture front side of card
      await Methods.instance
          .capturePng(
        cardSideKey: RepaintCard.frontScreenSnap,
      )
          .then((value) => _front = value.buffer.asUint8List())
          .whenComplete(
            ()async =>
            ///capture back side of card
         await  Methods.instance
            .capturePng(
          cardSideKey: RepaintCard.backScreenSnap,
        )
            .then((value) => _back = value.buffer.asUint8List()),
      );
      ///Card will  added to List in Local storage
      PDF.addPNGCardToList(HIVECardSides(
        front: Methods.instance.convertUint8ListToString(_front!),
        back: Methods.instance.convertUint8ListToString(_back!),
      ));
      ///success show
      App.snackBar(context,text: 'Card has been added to PDF page',seconds: 3);
      ///save current decoration  in local storage
      ///we will upload this data to server when we generating PDF file
      ///
      // print(_user!.toJson());
      var encode=jsonEncode(_user!.toJson());

      Boxes.instance.tempCheckCardDecorationBox.add(encode);


      ///show PDF Test widget
      ///
      MultiCards.instance.show(context);
      // PDF.dialogMultipleCardTestPDF(context,name: '${Boxes.instance.bytePNGCardsBox.length} Cards');



    }else{
      ///when Space not available in A4 page
      ///when number of cards is reach to 10 you will not be able to insert more cards
      ///A4 Size page can only support 10 PVC International cards sizes
      App.snackBar(context,text: 'The cards Cannot be exceeded of 10',seconds: 5,textColor:Colors.white,color: Colors.redAccent);

    }
  }




}


