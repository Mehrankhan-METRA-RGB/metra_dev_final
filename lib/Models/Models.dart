
// import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:metra_dev/Console/Name_Logo.dart';

///Used to carry only  Radius of widget in a Card
class RadiusCard {
  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  RadiusCard({this.topLeft, this.topRight, this.bottomLeft, this.bottomRight});
  factory RadiusCard.fromJson(Map<String, dynamic> json) {
    return RadiusCard(
      topRight: json["topRight"].toDouble(),
      topLeft: json["topLeft"].toDouble(),
      bottomRight: json['bottomRight'].toDouble(),
      bottomLeft: json['bottomLeft'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'topLeft': topLeft,
    'topRight': topRight,
    'bottomLeft': bottomLeft,
    'bottomRight': bottomRight
  };
}
///Used to carry only  Padding of widget in a Card
class PaddingCard {
  final double? vertical;
  final double? horizontal;

  PaddingCard({this.vertical, this.horizontal});
  factory PaddingCard.fromJson(Map<String, dynamic> json) {
    return PaddingCard(
      vertical: json["vertical"].toDouble(),
      horizontal: json["horizontal"].toDouble(),
    );
  }
  Map<String, dynamic> toJson() =>
      {'vertical': vertical, 'horizontal': horizontal};
}

class PositionCard {
  final double? dx;
  final double? dy;
  PositionCard({this.dx, this.dy});
  factory PositionCard.fromJson(Map<String, dynamic> json) {
    return PositionCard(
      dx: json["dx"].toDouble(),
      dy: json["dy"].toDouble() ,
    );
  }
  Map<String, dynamic> toJson() => {
    'dx': dx!,
    'dy': dy!,
  };
}
///Used to carry only Card Text Decoration for Single unit
class CardTextStyle{
  final int? labelColor;
  final int? valueColor;
  final int? bgColor;
  final int? underlineColor;
  final double? labelSize;
  final double? valueSize;
  final double? underlineHeight;
  final double? underlineWidth;
  final String? labelFontFamily;
  final String? valueFontFamily;
  final PaddingCard? padding;
  final RadiusCard? radius;
  final String? boxStyle;
  final PositionCard? position;
  final String? label;
  final String? value;

  CardTextStyle({
    this.label,
    this.value,
    this.labelColor,
    this.valueColor,
    this.bgColor,
    this.underlineColor,
    this.underlineHeight,
    this.underlineWidth,
    this.labelSize,
    this.valueSize,
    this.labelFontFamily,
    this.valueFontFamily,
    this.padding,
    this.radius,
    this.boxStyle,
    this.position,
  });

  factory CardTextStyle.fromJson(Map<String,dynamic> json){
    return CardTextStyle(padding: PaddingCard.fromJson(json['padding']),
      radius: RadiusCard.fromJson(json['radius']),
      position: PositionCard.fromJson(json['position']),
      label: json['label'],
      labelSize: json['labelSize']!=null?json['labelSize'].toDouble():0,
      labelColor: json['labelColor'],
      labelFontFamily: json['labelFontFamily'],
      value: json['value'],
      valueSize: json['valueSize'].toDouble(),
      valueColor: json['valueColor'],
      valueFontFamily: json['valueFontFamily'],
      bgColor: json['bgColor'],
      underlineColor: json['underlineColor'],
      underlineHeight: json['underlineHeight']!=null?json['underlineHeight'].toDouble():0,
      underlineWidth: json['underlineWidth']!=null?json['underlineWidth'].toDouble():0,
      boxStyle: json['boxStyle'],);
  }
  Map<String,dynamic> toJson(){
    Map<String,dynamic> _padding=this.padding!.toJson();
    Map<String,dynamic> _radius=this.radius!.toJson();
    Map<String,dynamic> _position=this.position!.toJson();

    return {
      'padding': _padding,
      'radius': _radius,
      'position': _position,
      'label': label,
      'labelSize': labelSize,
      'labelColor': labelColor,
      'labelFontFamily': labelFontFamily,
      'value':value,
      'valueSize': valueSize,
      'valueColor': valueColor,
      'valueFontFamily': valueFontFamily,
      'bgColor': bgColor,
      'underlineColor': underlineColor,
      'underlineHeight': underlineHeight,
      'underlineWidth': underlineWidth,
      'boxStyle': boxStyle,
    };}

}
class CardBackgroundStyle{
  final int? overlayColor;
  final int? bgImage;
  CardBackgroundStyle({this.bgImage,this.overlayColor});
  factory CardBackgroundStyle.fromJson(Map<String,dynamic> json){return CardBackgroundStyle(overlayColor:json['overlayColor'],bgImage: json['bgImage'] );}
  Map<String,dynamic> toJson(){return {
    'overlayColor':overlayColor!,
    'bgImage':bgImage!,
  };}
}
///Used to carry only Card QRCode Decoration
class CardQrCodeStyle {
  final PositionCard? position;
  final double? size;
  final int? bgColor;
  final int? color;

  CardQrCodeStyle({this.size, this.bgColor, this.color, this.position});

  factory CardQrCodeStyle.fromJson(Map<String, dynamic> json){
    return CardQrCodeStyle(
        position: PositionCard.fromJson(json['position']),
        size: json['size'].toDouble(),
        bgColor: json['bgColor'],
        color: json['color']
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic>? _position = this.position!.toJson();
    return {'position': _position,
      'size': size!,
      'bgColor': bgColor!,
      'color': color!
    };
  }
}
///Used to carry only Card logo Decoration
class CardLogoStyle {
  final PositionCard? position;
  final int? bgcolor;
  final RadiusCard? radius;
  final PaddingCard? padding;
  final double? size;
  CardLogoStyle({this.position, this.padding, this.radius, this.bgcolor, this.size});
  factory CardLogoStyle.fromJson(Map<String,dynamic> json){
    return CardLogoStyle(
      position: PositionCard.fromJson(json['position']),
      size: json['size'].toDouble(),
      bgcolor: json['bgcolor'],
      radius: RadiusCard.fromJson(json['radius']),
      padding: PaddingCard.fromJson(json['padding']),
    );}
  Map<String,dynamic> toJson(){
    Map<String,dynamic>? _position= this.position!.toJson();
    Map<String,dynamic>? _radius= this.radius!.toJson();
    Map<String,dynamic>? _padding= this.padding!.toJson();
    return {'position':_position,
      'size':size,
      'bgcolor':bgcolor,
      'padding':_padding,
      'radius':_radius,
    };}
}
///Used to carry only Card Profile Decoration
class CardProfileStyle {
  final PositionCard? position;
  final int bgcolor;
  final RadiusCard? radius;
  final PaddingCard? padding;
  final double? size;
  CardProfileStyle({this.position, this.padding, this.radius, this.bgcolor=0xfffffff, this.size});
  factory CardProfileStyle.fromJson(Map<String, dynamic> json) {return CardProfileStyle(
      position: PositionCard.fromJson(json['position']),
      bgcolor: json['bgcolor'],
      radius: RadiusCard.fromJson(json['radius']),
      padding: PaddingCard.fromJson(json['padding']),
      size: json['size'].toDouble()
  );}
  Map<String, dynamic> toJson(){
    Map<String,dynamic>? _position= this.position!.toJson();
    Map<String,dynamic>? _radius= this.radius!.toJson();
    Map<String,dynamic>? _padding= this.padding!.toJson();
    return {

      'position':_position,
      'bgcolor':bgcolor,
      'radius':_radius,
      'padding':_padding,
      'size':size};}
}
///Used to carry only Card All Text Decoration
class CardTextModel{
  final CardTextStyle? lv1;
  final CardTextStyle? lv2;
  final CardTextStyle? lv3;
  final CardTextStyle? lv4;
  final CardTextStyle? lv5;
  final CardTextStyle? lv6;
  final CardTextStyle? lv7;
  final CardTextStyle? orgName;
  CardTextModel({
    this.lv1 ,
    this.lv2 ,
    this.lv3 ,
    this.lv4,
    this.lv5 ,
    this.lv6 ,
    this.lv7 ,
    this.orgName,



  }
      );
  factory CardTextModel.fromJson(Map<String,dynamic> json){return CardTextModel(
    lv1: CardTextStyle.fromJson(json['lv1']),
    lv2:  CardTextStyle.fromJson(json['lv2']),
    lv3:  CardTextStyle.fromJson(json['lv3']),
    lv4:  CardTextStyle.fromJson(json['lv4']),
    lv5:  CardTextStyle.fromJson(json['lv5']),
    lv6:  CardTextStyle.fromJson(json['lv6']),
    lv7:  CardTextStyle.fromJson(json['lv7']),
    orgName:  CardTextStyle.fromJson(json['orgName']),
  );}

  Map<String,dynamic> toJson(){
    Map<String,dynamic> _lv1=this.lv1!.toJson();
    Map<String,dynamic> _lv2=this.lv2!.toJson();
    Map<String,dynamic> _lv3=this.lv3!.toJson();
    Map<String,dynamic> _lv4=this.lv4!.toJson();
    Map<String,dynamic> _lv5=this.lv5!.toJson();
    Map<String,dynamic> _lv6=this.lv6!.toJson();
    Map<String,dynamic> _lv7=this.lv7!.toJson();
    Map<String,dynamic> _orgName=this.orgName!.toJson();
    return {'lv1':_lv1,
      'lv2':_lv2,
      'lv3':_lv3,
      'lv4':_lv4,
      'lv5':_lv5,
      'lv6':_lv6,
      'lv7':_lv7,
      'orgName':_orgName,};}
}
///Used to carry only Card Decoration
class CardModel{
  final CardBackgroundStyle? background;
  final CardQrCodeStyle? qrCode;
  final CardLogoStyle? logo;
  final CardProfileStyle? profile;
  final CardTextModel? text;
  CardModel({this.text,
    this.profile,
    this.logo,
    this.background,
    this.qrCode});
  factory CardModel.fromJson(Map<String,dynamic> json){
    return CardModel(
      qrCode: CardQrCodeStyle.fromJson(json['qrCode']),
      logo: CardLogoStyle.fromJson(json['logo']),
      profile: CardProfileStyle.fromJson(json['profile']),
      background: CardBackgroundStyle.fromJson(json['background']),
      text: CardTextModel.fromJson(json['text']),
    );
  }
  Map<String,dynamic> toJson(){
    Map<String,dynamic> _background=this.background!.toJson();
    Map<String,dynamic> _qrCode=this.qrCode!.toJson();
    Map<String,dynamic> _logo=this.logo!.toJson();
    Map<String,dynamic> _profile=this.profile!.toJson();
    Map<String,dynamic> _text=this.text!.toJson();
    return {
      'qrCode': _qrCode,
      'logo': _logo,
      'profile': _profile,
      'background': _background,
      'text':_text,

    };}

}

///:Credentials
class Lv{
  final String? label;
  final String? value;
  const Lv({this.value,this.label});
  factory Lv.fromJson(Map<String,dynamic> json){
    return Lv(label: json['label'],value: json['value']);
  }
  Map<String,dynamic> toJson(){
    return {
      'label':label,
      'value': value,
    };
  }
}

///Used to carry user credentials + user Card decoration
class CardCredentials {
  final int? id;
  final Lv? lv1;
  final Lv? lv2;
  final Lv? lv3;
  final Lv? lv4;
  final Lv? lv5;
  final Lv? lv6;
  final Lv? lv7;
  final String? logo;
  final String? code;
  final String? qrCode;
  final String? orgName;
  final CompanyModel? company;
  final String? profile;
  final CardModel? decoration;
  const CardCredentials(
      {this.lv1,
        this.lv2,
        this.lv3,
        this.lv4,
        this.lv5,
        this.lv6,
        this.lv7,
        this.logo,
        this.orgName,
        this.company,
        this.code,
        this.qrCode,
        this.profile,
        this.decoration,
        this.id,
      });

  factory CardCredentials.fromJson(Map<String, dynamic> json) {
    return CardCredentials(
      id: json['id'] as int,
      lv1:Lv.fromJson(json['lv1'])  ,
      lv2: Lv.fromJson(json['lv2']) ,
      lv3: Lv.fromJson(json['lv3'] ),
      lv4: Lv.fromJson(json['lv4']) ,
      lv5: Lv.fromJson(json['lv5']) ,
      lv6: Lv.fromJson(json['lv6']) ,
      lv7: Lv.fromJson(json['lv7']) ,
      profile: json['profile'] as String,
      orgName: json['orgName'] as String,
      qrCode: json['qrCode'] as String,
      logo: json['logo'] as String,
      company: CompanyModel.fromJson(json['company']),
      decoration: CardModel.fromJson(json['decoration']),

      code: json['code'] as String,

    );
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> _lv1=this.lv1!.toJson();
    Map<String,dynamic> _lv2=this.lv2!.toJson();
    Map<String,dynamic> _lv3=this.lv3!.toJson();
    Map<String,dynamic> _lv4=this.lv4!.toJson();
    Map<String,dynamic> _lv5=this.lv5!.toJson();
    Map<String,dynamic> _lv6=this.lv6!.toJson();
    Map<String,dynamic> _lv7=this.lv7!.toJson();
    Map<String,dynamic> _decoration=this.decoration!.toJson();
    Map<String,dynamic> _company=this.company!.toJson();
    return {
      'id':  id,
      'lv1':_lv1,
      'lv2': _lv2,
      'lv3': _lv3,
      'lv4': _lv4,
      'lv5': _lv5,
      'lv6': _lv6,
      'lv7': _lv7,
      'profile':profile,
      'qrCode': qrCode,
      'orgName': orgName,
      'company': _company,
      'logo': logo,
      'decoration': _decoration,
      'code': code,

    };
  }

}






///USE in PDF to carry both side cards images Uint8List
class CardSides {
  final Uint8List? front;
  final Uint8List? back;
  CardSides({this.front, this.back});
  factory CardSides.fromJson(Map<String, dynamic> json) {
    return CardSides(front: json['front'], back: json['back']);
  }
  Map<String, dynamic> toJson() {
    return {
      'front': front,
      'back': back,
    };
  }
}
///USE in HIVE to carry both side cards images String
class HIVECardSides {
  final String? front;
  final String? back;
  HIVECardSides({this.front, this.back});
  factory HIVECardSides.fromJson(Map<String, dynamic> json) {
    return HIVECardSides(front: json['front'], back: json['back']);
  }
  Map<String, dynamic> toJson() {
    return {
      'front': front,
      'back': back,
    };
  }
}
///[MultiCardsA4Size] Will Carry cards from local storage
///
/// This will carry cards from 1-10
class MultiCardsA4Size {
  final CardSides? c0;
  final CardSides? c1;
  final CardSides? c2;
  final CardSides? c3;
  final CardSides? c4;
  final CardSides? c5;
  final CardSides? c6;
  final CardSides? c7;
  final CardSides? c8;
  final CardSides? c9;
  MultiCardsA4Size({
    this.c0,
    this.c1,
    this.c2,
    this.c3,
    this.c4,
    this.c5,
    this.c6,
    this.c7,
    this.c8,
    this.c9,
  });
  factory MultiCardsA4Size.fromJson(Map<String, dynamic> json) {
    return MultiCardsA4Size(
      c0: CardSides.fromJson(json['c0']),
      c1: CardSides.fromJson(json['c1']),
      c2: CardSides.fromJson(json['c2']),
      c3: CardSides.fromJson(json['c3']),
      c4: CardSides.fromJson(json['c4']),
      c5: CardSides.fromJson(json['c5']),
      c6: CardSides.fromJson(json['c6']),
      c7: CardSides.fromJson(json['c7']),
      c8: CardSides.fromJson(json['c8']),
      c9: CardSides.fromJson(json['c9']),
    );
  }
  Map<String, dynamic> toJson() {
    Map<String,dynamic> _c0=this.c0!.toJson();
    Map<String,dynamic> _c1=this.c1!.toJson();
    Map<String,dynamic> _c2=this.c2!.toJson();
    Map<String,dynamic> _c3=this.c3!.toJson();
    Map<String,dynamic> _c4=this.c4!.toJson();
    Map<String,dynamic> _c5=this.c5!.toJson();
    Map<String,dynamic> _c6=this.c6!.toJson();
    Map<String,dynamic> _c7=this.c7!.toJson();
    Map<String,dynamic> _c8=this.c8!.toJson();
    Map<String,dynamic> _c9=this.c9!.toJson();
    return {
      'c0': _c0,
      'c1': _c1,
      'c2': _c2,
      'c3': _c3,
      'c4': _c4,
      'c5': _c5,
      'c6': _c6,
      'c7': _c7,
      'c8': _c8,
      'c9': _c9,
    };
  }
}

