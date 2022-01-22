import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../Contsants/app.dart';
import '../../Databases/Boxes/Boxes.dart';
import '../../Models/Models.dart';

import 'package:path_provider/path_provider.dart';




class PDF {
  static double? cardWidth = 246.2362208;
  static double? cardHeight = 163.87874;



  ///This Method will add  [Bytes-PNG]  card to [bytePNGCardsBox] in Boxes class
  static addPNGCardToList(HIVECardSides? cardSides) async {
    if (Boxes.instance.bytePNGCardsBox.length < 10) {
      var _json = HIVECardSides(front: cardSides!.front, back: cardSides.back);
      var endCode = jsonEncode(_json);
      await Boxes.instance.bytePNGCardsBox.add(endCode);
    }

  }

  ///This Method will get  [Bytes-PNG] from [bytePNGCardsBox] at a particular index
  @deprecated
  static getPNGCardFromList({
    int? index,
  }) {
    var decode = jsonDecode(Boxes.instance.bytePNGCardsBox.getAt(index!));
    // CardSides? cardSides=decode;
    return decode;
  }

  static _imagePDF({Uint8List? img,}) {

    return Container(
        margin: EdgeInsets.symmetric( vertical: (PVCSize.instance.getEmptyHeight/6)/2),
        child: img != null
            ? Image(MemoryImage(img),
            width: PVCSize.instance.singleCardWidth,
            height: PVCSize.instance.singleCardHeight

        )
            : Container(width: PVCSize.instance.singleCardWidth,));
  }



  ///Create Multi Card PDF --> for Console Route only
  static Future generateMultipleCardPDF(
      {MultiCardsA4Size? card, name, context}) async {
    final pdf = Document();
    print(PdfPageFormat.a4.width);
      front(CardSides? _crd,) =>_crd != null ? _crd.front : null;
      back(CardSides? _crd,) =>_crd != null ? _crd.back : null;


    TableRow frontRow( img1, img2)=> TableRow(children:[
      _imagePDF(img: front(img1)),
      SizedBox(width: PVCSize.instance.getEmptyWidth/3),
      _imagePDF(img: front(img2))
    ], );
    TableRow backRow( img2, img1)=> TableRow(children:[
      _imagePDF(img: back(img2)),
      SizedBox(width: PVCSize.instance.getEmptyWidth/3),
      _imagePDF(img: back(img1))
    ], );
    pdf.addPage(Page(

      margin: EdgeInsets.symmetric(horizontal:PVCSize.instance.getEmptyWidth/3,vertical:PVCSize.instance.getEmptyHeight/6 ),
      pageFormat: PdfPageFormat.a4,

      build: (context) => Table(tableWidth: TableWidth.max,
          children: [
            frontRow(card!.c0,card.c1),
            frontRow(card.c2,card.c3),
            frontRow(card.c4,card.c5),
            frontRow(card.c6,card.c7),
            frontRow(card.c8,card.c9),

          ]),
    ));
    pdf.addPage(Page(
      margin: EdgeInsets.symmetric(horizontal:PVCSize.instance.getEmptyWidth/3,vertical:PVCSize.instance.getEmptyHeight/6 ),
      pageFormat: PdfPageFormat.a4,
      build: (context) => Table(tableWidth: TableWidth.max,
          children: [
            backRow(card!.c1,card.c0),
            backRow(card.c3,card.c2),
            backRow(card.c5,card.c4),
            backRow(card.c7,card.c6),
            backRow(card.c9,card.c8),
          ]),
    ));



    return PDF.saveMultiCards(name: name, pdf: pdf, context: context);
  }

  ///Create single Card PDF --> held in VirtualCard Route only
  static Future<File> generateSinglePDF(
      {Uint8List? frontImage,Uint8List? backImage, name, context}) async {
    final pdf = Document();

    print(PVCSize.instance.getEmptyHeight/6);
    final image = MemoryImage(
      frontImage!,
    );
    final image2 = MemoryImage(
      backImage!,
    );



    pdf.addPage(Page(

      // margin: EdgeInsets.all(15),
      pageFormat: PdfPageFormat.a4,
      build: (context) => Container(
color: PdfColor.fromRYB(0.5, 0.7, 0.44),
        width: PdfPageFormat.a4.width,
        alignment: Alignment.topLeft,
        margin: EdgeInsets.symmetric(horizontal:PVCSize.instance.getEmptyWidth/3,vertical:PVCSize.instance.getEmptyHeight/6 ),
        child:Image(image, width: PVCSize.instance.singleCardWidth, height: PVCSize.instance.singleCardHeight),
      ),
    ));
    pdf.addPage(Page(
      // margin: EdgeInsets.all(10),
      pageFormat: PdfPageFormat.a4,
      build: (context) => Container(
        width: PdfPageFormat.a4.width,
        alignment: Alignment.topRight,
        margin: EdgeInsets.symmetric(horizontal:PVCSize.instance.getEmptyWidth/3,vertical:PVCSize.instance.getEmptyHeight/6 ),
        child:  Image(image2, dpi: 300.0, width: 246.2362208, height: 163.87874,),
      ),
    ));

    return saveSingleCard(name: name, pdf: pdf, context: context);
  }


///save multi cards
  static Future<File> saveMultiCards(
      {required name, required pdf, context}) async {
    Directory? appDocumentDir = await getExternalStorageDirectory();

    final bytes = await pdf.save();

    ///get current company from local storage
    var _currentCompanyName =
        Boxes.instance.currentCompanyBox.get(Boxes.CurrentCompanyKey)[1];
    // File? file;
    ///create all  directories given in URI if not exist
    Directory('${appDocumentDir!.path}/Metra/Companies/$_currentCompanyName/')
        .createSync(recursive: true);
    ///give a path to file
    File file = File(
        '${appDocumentDir.path}/Metra/Companies/$_currentCompanyName/$name.pdf');


    ///Write the PDF in a given file path
     file.writeAsBytes(bytes).then((value) => App.snackBar(
      context,
      text: ' PDF Saved in \n ${value.path}',
      seconds: 2,
    ),);

    print('PDF Saved in $file');

    return file;
  }

  ///save single card
  static Future<File> saveSingleCard(
      {required name, required pdf, context}) async {
   Directory? appDocumentDir = await getExternalStorageDirectory();

    final bytes = await pdf.save();

    ///create all  directories given in URI if not exist
    Directory('${appDocumentDir!.path}/VCard/')
        .createSync(recursive: true);
    ///give a path to file
    File file = File('${appDocumentDir.path}/VCard/$name.pdf');


    ///Write the PDF in a given file path
    file.writeAsBytes(bytes).then((value) => App.snackBar(
      context,
      text: ' PDF Saved in \n ${value.path}',
      seconds: 2,
    ),);

    print('PDF Saved in $file');

    return file;
  }


//  Future openfile(File file) async {
  //   final url = file.path;
  //   await OpenFile.open(url);
  // }
}



class PVCSize{
  PVCSize._private();
  static final instance=PVCSize._private();
  double _pageWidth=PdfPageFormat.a4.width;
  double _pageHeight=PdfPageFormat.a4.height;
  ///Percentage counted from A4 size page having
  ///C-80 pvc card sizes in millimeters
  /// A4SizeWidth=210.058mm
  /// A4SizeHeight=296.926mm
  ///singleCardWidth=85.6mm
  ///singleCardHeight=53.975mm
  final  double _emptyWidth=18.5013;/// %
  final  double _singleCardWidth=40.75065;/// %
  final  double _emptyHeight=9.1103507;/// %
  final  double _singleCardHeight=18.17793;/// %


  double get getEmptyWidth=>(_pageWidth*_emptyWidth)/100;

  double get getEmptyHeight=>(_pageHeight*_emptyHeight)/100;

  double get singleCardWidth=> (_pageWidth*_singleCardWidth)/100;

  double get singleCardHeight=>(_pageHeight*_singleCardHeight)/100;



}