import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:popup_menu/popup_menu.dart';

import '../Contsants/Data.dart';
import '../Contsants/app.dart';
import '../Databases/Boxes/Boxes.dart';
import '../Databases/saveCardsLocal.dart';
import '../Models/Models.dart';
import 'Editor/Card.dart';
import 'Editor/CardMethods.dart';

class CardDesigns extends StatefulWidget {
  final ValueChanged<int>? onChange;
  final double size;
  final CardCredentials? credentials;

  static double cardHeight = AppDefault.cardHeightSize;
  static double cardWidth = AppDefault.cardWidthSize;
  CardDesigns({
    this.credentials = const CardCredentials(
        lv1: Lv(label: 'Label', value: 'Value'),
        lv2: Lv(label: 'Label', value: 'Value'),
        lv3: Lv(label: 'Label', value: 'Value'),
        lv4: Lv(label: 'Label', value: 'Value'),
        lv5: Lv(label: 'Label', value: 'Value'),
        lv6: Lv(label: 'Label', value: 'Value'),
        lv7: Lv(label: 'Label', value: 'Value'),
        code: '0977554',
        logo: '00',
        profile: '00',
        orgName: 'Metra',
        id: 1),
    this.onChange,
    this.size = 1,
  });
  @override
  _CardDesignsState createState() => _CardDesignsState();
}

class _CardDesignsState extends State<CardDesigns> {
  var list;
  var box;
  var cardbox = Boxes.instance.savedLocalCardListBox;
  var data;
  // GlobalKey btnKey = GlobalKey();
// var a=  Boxes.getSaveCardsLocal();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  var _width, _height;
  double _sizeRatio = 1;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _sizeRatio = _width >= 500 ? 1.4 : 0.8;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,

        elevation: 0,
        actions: [
       Row(crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text('Saved Cards',style: NeumorphicTheme.currentTheme(context).appBarTheme.textStyle,),
         ],
       ),
SizedBox(width: 15,),
        ],
      ),
      body: Container(
        height: _height,
        width: _width,
        alignment: Alignment.center,
        // padding: EdgeInsets.symmetric(vertical: 30),
        child: card(context),
      ),
    );
  }

  callback() {
    var callback = widget.onChange;
    if (callback != null) {
      int card = 1;
      callback(card);
    }
  }

  Widget card(
    BuildContext context,
  ) {
    var _activatedCardKey =
        Boxes.instance.activatedCardBox.get(Boxes.ActivatedCardKey);
    return ListView.builder(
      itemCount: cardbox.length > 0 ? cardbox.length : 1,
      itemBuilder: (context, position) {
        SaveCardsLocal? _card;
        var _json;
        var _currentCardKey;
        if (cardbox.length > 0) {
          _card = cardbox.getAt(position)!;
          _currentCardKey = _card.key;
          _json = Methods.instance.encodedJsonToCard(_card.details!);
        }

        return Container(
          alignment: Alignment.center,
          width: CardDesigns.cardWidth * _sizeRatio,
          height: CardDesigns.cardHeight * _sizeRatio,
          margin: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            // color: Colors.indigo.withOpacity(0.1),
            borderRadius: BorderRadius.circular(2 * widget.size),
          ),
          child: cardbox.length > 0
              ? GestureDetector(
                  onLongPressStart: (details) {
                    offsetPopMenu(context,
                        json: _json, position: position, details: details);
                  },
            // onHorizontalDragStart: (dragDetails){
            //        var initPos= dragDetails.localPosition.dx;
            //
            //
            // },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      FlipCard(
                        flipOnTouch: true,
                        front: AppCard(
                          isEditable: false,
                          decoration: _json,
                          userData: widget.credentials,
                          sizeRatio: _sizeRatio,
                          activeSide: AppCard.front,
                          onChange: (a) {
                            setState(() {});
                          },
                        ),
                        back: AppCard(
                          isEditable: false,
                          decoration: _json,
                          userData: widget.credentials,
                          sizeRatio: _sizeRatio,
                          activeSide: AppCard.back,
                          onChange: (a) {
                            setState(() {});
                          },
                        ),
                      ),

                      ///show green tick icon when current card key equal to activated card key

                      _currentCardKey == _activatedCardKey
                          ? Neumorphic(
                              padding: EdgeInsets.all(1),
                              style: NeumorphicStyle(
                                  depth: 0,
                                  color: Colors.green,
                                  boxShape: NeumorphicBoxShape.circle()),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: NeumorphicIcon(
                                  Icons.check_circle,
                                  size: _width >= 500 ? 30 : 15,
                                  style: NeumorphicStyle(
                                      depth: 4,
                                      color: Colors.green,
                                      shape: NeumorphicShape.convex),
                                ),
                              ),
                            )
                          : Container(
                              width: 2,
                              height: 2,
                            ),
                    ],
                  ),
                )
              : Center(
                  child: Text('No cards available',
                      style: NeumorphicTheme.currentTheme(context)
                          .textTheme
                          .bodyText1),
                ),
        );
      },
    );
  }

  offsetPopMenu(BuildContext context,
      {position, CardModel? json, LongPressStartDetails? details}) {
    double iconSize = _width >= 500 ? 24 : 15;
    TextStyle _style =
        TextStyle(fontSize: _width >= 500 ? 12 : 9,
            color: Color(0xffb8b8b8));

    var _x, _y;
    setState(() {
      _x = details!.globalPosition.dx;
      _y = details.globalPosition.dy;
    });

    Timer(Duration(milliseconds: 800), () {
      return App.offsetAlert(context, offset: Offset(_x, _y),
          items: [
        MenuItem(
            textStyle: _style,
            title: 'Edit',
            image: Icon(
              Icons.edit,
              color: Colors.white60,
              size: iconSize,
            )),
        MenuItem(
            textStyle: _style,
            title: 'Delete',
            image: Icon(
              Icons.delete,
              color: Colors.red.withOpacity(0.7),
              size: iconSize,
            )),
        MenuItem(
            textStyle: _style,
            title: 'Activate',
            image: Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: iconSize,
            )),
      ],
          onClickMenu: (item) {
        setState(() {
          switch (item.menuTitle) {
            case 'Edit':
              print('edit');
              break;
            case 'Delete':
              if (position < AppDefault.selectedCardDesignPosition) {
                AppDefault.selectedCardDesignPosition =
                    AppDefault.selectedCardDesignPosition - 1;
                // AppDefault.selectedCardDesign=json;
              }
              cardDelete(
                position,
                context: context,
              );

              callback();
              // print(' IdCard: $position deleted');
              break;
            case 'Activate':
              // AppDefault.selectedCardDesign = json;
            _activate(position);
              break;
            case 'other':
              break;
          }
        });
      });
    });
  }



_activate(position){
  AppDefault.selectedCardDesignPosition = position.toDouble();
  Methods.instance.activateCard(context, position: position);

  // print(AppDefault.selectedCardDesignposition);
  print(Methods.instance.getActivatedCard!.background!.bgImage);
}
  void cardDelete(position,
      {deleteOption = 'only', BuildContext? context}) async {
    var snackBar = App.snackBar(context,
        seconds: 4,
        text: deleteOption == 'only'
            ? 'Card has been Deleted'
            : 'All Cards has been Deleted');

    if (deleteOption == 'all') {
      ///delete all saved cards
      await cardbox.deleteFromDisk().then((value) => snackBar);
      await Boxes.instance.activatedCardBox.delete(Boxes.ActivatedCardKey);
    } else {
      ///delete selected card

      var _currentCardKey = cardbox.getAt(position)!.key;
      await cardbox.delete(_currentCardKey).then((value) => snackBar);
      var _activatedCardKey =
          Boxes.instance.activatedCardBox.get(Boxes.ActivatedCardKey);
      print('activated: $_activatedCardKey\ncurrent:$_currentCardKey');

      ///if activated card tried to be deleted
      ///then activated key will also be deleted
      print('card  deleted ');
      if (_activatedCardKey == _currentCardKey) {
        await Boxes.instance.activatedCardBox.delete(Boxes.ActivatedCardKey);
        print('Activated key also deleted');
      }
      Navigator.pushReplacement(context!, MaterialPageRoute(builder: (context) {
        return CardDesigns();
      }));
    }
  }
}
