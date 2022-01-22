import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pdf/pdf.dart';
import '../../Contsants/Data.dart';
import '../../Contsants/app.dart';
import '../../Databases/Boxes/Boxes.dart';
import '../../Models/Models.dart';
import '../Authentications/JWT.dart';
import '../Editor/CardMethods.dart';
import 'PDF.dart';

class MultiCards {
  MultiCards._private();
  static final MultiCards instance = MultiCards._private();


  ///This will retrieve All cards as MultiCardsA4Size
   MultiCardsA4Size? get getAllPNGCards {
    List<HIVECardSides> cardSidesList = [];
    for (var i = 0; i <= Boxes.instance.bytePNGCardsBox.length - 1; i++) {
      var decode = jsonDecode(Boxes.instance.bytePNGCardsBox.getAt(i));
      // print('decode:${decode!['front'][300]}');
      cardSidesList.add(HIVECardSides(
        front: decode!['front'],
        back: decode!['back'],
      ));

    }
    bool check(index) => cardSidesList.length >= index + 1;
    CardSides? cardSide(index) {
      return CardSides(
        front: Methods.instance
            .convertStringToUint8List(cardSidesList[index].front!),
        back: Methods.instance
            .convertStringToUint8List(cardSidesList[index].back!),
      );
    }

    return MultiCardsA4Size(
      c0: check(0) ? cardSide(0) : null,
      c1: check(1) ? cardSide(1) : null,
      c2: check(2) ? cardSide(2) : null,
      c3: check(3) ? cardSide(3) : null,
      c4: check(4) ? cardSide(4) : null,
      c5: check(5) ? cardSide(5) : null,
      c6: check(6) ? cardSide(6) : null,
      c7: check(7) ? cardSide(7) : null,
      c8: check(8) ? cardSide(8) : null,
      c9: check(9) ? cardSide(9) : null,
    );
  }




  ///Delete PNG Cards
   Future _deleteAll(BuildContext context) async {
    var length = Boxes.instance.bytePNGCardsBox.length;
    ///PNG Cards Keys from local Storage
    List pngCardsListKeys = [];
    ///decoration of PNG Cards Keys from local Storage
    List decorationListKeys = [];
    //  await Boxes.instance.bytePNGCardsBox.deleteFromDisk();
    // await  Boxes.instance.tempCheckCardDecorationBox.deleteFromDisk();
    // print('eLength:$length');
    ///collect list of keys using for-loop
    for (var i = 0; i < length; i++) {
      // print('index:$i');
      var pngkey = Boxes.instance.bytePNGCardsBox.keyAt(i);
      var decorkey = Boxes.instance.tempCheckCardDecorationBox.keyAt(i);

      ///adding keys to list
      pngCardsListKeys.add(pngkey);
      decorationListKeys.add(decorkey);
    }

    ///delete all key values from local storage using List of keys we have collected
    await Boxes.instance.bytePNGCardsBox
        .deleteAll(pngCardsListKeys)
        .whenComplete(
          () async => await Boxes.instance.tempCheckCardDecorationBox
          .deleteAll(decorationListKeys),
    )
        .whenComplete(
            () => App.snackBar(context, text: 'Page cleared...',seconds: 1,color: Colors.green,textColor: Colors.white),)
        .whenComplete(
          () => Navigator.pop(context),
    );
  }



  ///This future Method use to upload List of Cards-decoration in local Storage to server
  Future _uploadCardDecoration(BuildContext context) async {
    http.Response? res;

    ///get all decorations from local storage assign to listOfDecorations
    List listOfDecorations = [];
    for (var i = 0; i < Boxes.instance.tempCheckCardDecorationBox.length; i++) {
      var key = Boxes.instance.tempCheckCardDecorationBox.keyAt(i);
      listOfDecorations.add(
        Boxes.instance.tempCheckCardDecorationBox.get(key),
      );
    }
    var encode = jsonEncode(listOfDecorations);

    ///update check in database of current user by adding decoration to server
    /// to show green tick means that card has already been generated for current user
    try {
      res = await http.post(
          Uri.parse('http://$androidLocalHost:8080/card/decoration/user'),
          body: {
            'token': JWT.getLocalConsoleAuth['account'][0]['token'],
            'decoration': encode,
          });

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
      App.snackBar(context,
          text: 'Card decorations uploaded', color: Colors.green, textColor: Colors.white);
      print('Decorations Uploaded');
    } else {
      print('Problem Occurred');
    }
    return res.statusCode;
  }

  _showError(BuildContext context) => App.snackBar(context,
      text: 'No Cards in PDF', color: Colors.red, textColor: Colors.white70);

  ///Show generated PDF cards in Demo page
   show(BuildContext context)  {
     int _length = Boxes.instance.tempCheckCardDecorationBox.length;
     bool? isNullPage = _length < 1 ? false : true;
   return Navigator.push(context, MaterialPageRoute(builder: (context) =>DemoCardsPage(
      card: getAllPNGCards,
      actions: [///Delete Button
        Spacer(),
        IconButton(
            onPressed: () async => isNullPage
                ? await _deleteAll(context)
                : _showError(context),
            icon: Icon(
              Icons.delete,
              color: isNullPage
                  ? Color(0xffeaefef)
                  :

              ///prior transparent
              Color(0x56393737),
            )),

        ///Save Data
        App.buttonIOS(context,text:'Save as PDF',
          onPressed: () async => isNullPage
              ?  PDF
              .generateMultipleCardPDF(
              card: getAllPNGCards!,
              name: '${Boxes.instance.bytePNGCardsBox.length} Cards ${DateTime.now().year.toString()}',
              context: context)
              .then((a) async =>await _uploadCardDecoration(context))
              : _showError(context),
          color: isNullPage
              ? NeumorphicTheme.currentTheme(context).appBarTheme.textStyle!.color!.withOpacity(0.5)
              : NeumorphicTheme.accentColor(context).withOpacity(0.34),

        ),
      SizedBox(width: 15,),
      ],
    )));

  }
}

class DemoCardsPage extends StatelessWidget {
  final double? scale;
  final MultiCardsA4Size? card;
  final List<Widget>? actions;
  DemoCardsPage({this.scale = 1, this.card,this.actions,});
 final double? a4Width = 595.275590551181;

  _imagePDF({Uint8List? img}) {
    // print('SIZE IN MB:${(img!.lengthInBytes / 1024) / 1024}');
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: img != null
          ? Image(
              image: MemoryImage(img, scale: 1),
            )
          : Container(),
    );
  }

  front(
    CardSides? _crd,
  ) =>
      _crd != null ? _crd.front : null;
  back(
    CardSides? _crd,
  ) =>
      _crd != null ? _crd.back : null;
  // ignore: unused_element
  _showError(BuildContext context) => App.snackBar(context,
      text: 'No Cards in PDF', color: Colors.red, textColor: Colors.white70);

  @override
  Widget build(BuildContext context) {
    // pdf.TableWidth.min,
    return
        Scaffold(
            appBar: AppBar(actions: [Row(crossAxisAlignment: CrossAxisAlignment.center,children: [Text('PDF',style: NeumorphicTheme.currentTheme(context).appBarTheme.textStyle,),SizedBox(width: 15,)],)],),

            body:
        SingleChildScrollView(
          child: Container(
      alignment: Alignment.topCenter,
      // width: MediaQuery.of(context).size.width,
      child: Column(
          children: [
            ///front page
            Container(
              // width: PdfPageFormat.a4.width * sizeRatio!,
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 0.5)),
              child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      _imagePDF(img: front(card!.c0)),
                      _imagePDF(img: front(card!.c1)),
                    ]),
                    TableRow(children: [
                      _imagePDF(img: front(card!.c2)),
                      _imagePDF(img: front(card!.c3)),
                    ]),
                    TableRow(children: [
                      _imagePDF(img: front(card!.c4)),
                      _imagePDF(img: front(card!.c5)),
                    ]),
                    TableRow(children: [
                      _imagePDF(img: front(card!.c6)),
                      _imagePDF(img: front(card!.c7)),
                    ]),
                    TableRow(children: [
                      _imagePDF(img: front(card!.c8)),
                      _imagePDF(img: front(card!.c9)),
                    ]),
                  ]),
            ),

            ///back page
            SizedBox(
              height: 20,
            ),
            Container(
              width: PdfPageFormat.a4.width * scale!,
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 0.5)),
              child: Table(children: [
                TableRow(children: [
                  _imagePDF(img: back(card!.c1)),
                  _imagePDF(img: back(card!.c0)),
                ]),
                TableRow(children: [
                  _imagePDF(img: back(card!.c3)),
                  _imagePDF(img: back(card!.c2)),
                ]),
                TableRow(children: [
                  _imagePDF(img: back(card!.c5)),
                  _imagePDF(img: back(card!.c4)),
                ]),
                TableRow(children: [
                  _imagePDF(img: back(card!.c7)),
                  _imagePDF(img: back(card!.c6)),
                ]),
                TableRow(children: [
                  _imagePDF(img: back(card!.c9)),
                  _imagePDF(img: back(card!.c8)),
                ]),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
          ],
      ),
    ),
        ),
          bottomNavigationBar: Container(color:NeumorphicTheme.accentColor(context),height: 60,child:Row(children: actions!,),),
        );
  }
}
