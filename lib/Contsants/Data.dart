import 'dart:core';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
var width,height;
// var androidLocalHost = 'localhost';
var androidLocalHost = '192.168.8.102';
var urlHeader='http://$androidLocalHost:8080/';
List? urlList=[];
// var androidLocalHost = '255.255.255.0';
GlobalKey<FlipCardState> flipCardKey = GlobalKey<FlipCardState>();
GlobalKey key1 = GlobalKey();
String imageBackgroundURL = 'assets/images/P${AppDefault.defaultPositionBackgrndImage.toString()}.png';
class AppDefault{
 static GlobalKey<FlipCardState>? designListFlipKey=GlobalKey<FlipCardState>();
static String widgetIdCarrier = CaseId.textCaseId;


 static var userId=00000;
 static var defaultCompany;
static Color listColor=Color(0xe694aaa8);
static List<String> designCardListJSONS=[];
static var selectedCardDesign;
 static var selectedCardDesignPosition=0.1;
static String seekbarName = 'Text Size';
 static double defaultHorVal=30.0;
 static double defaultVertVal=30.0;
 static double textMinimumSize = 1, textMaximumSize = 100;
 static double defaultSize = 12;
 static String form = 'form';
 static bool isObscure = true;
 // ignore: non_constant_identifier_names
 static bool org_acc = true;
 static double radiusMedium=10.8850;
 static double radiusMax=11.338526;
 static int defaultPositionBackgrndImage=1;
 static int defaultPositionDesignList=0;
 static double cardHeightSize=168.0;
 static double cardWidthSize=272.0;

 static int pickerColor = 0xff443a49;
 static Color currentColor = Color(0xff443a49);
 static Color backgroundApp = Color(0xffdbe5e7);
 static Color backgroundAppBar = Color(0xff222323);

static var qrValue = 'Mehran.ullah%0977665345677%jharai.';
}
class BoxHeight{
 static double organization=30;
}
class BoxWidth{
 static double organization=90;
}

///:Color Values
class ColorValue{
 static Color color=Color(0x9a9fd9ec);
 static int organizationBackground =0x242324;
 static int organizationText =0xFD242324;
 static int label =0xFD242324;
 static int labelBackground =0x242324;
 static int text =0xff1d1d1d;
 static int textBackground =0x21d1d1d;
static int profileColorValue =0xff443a49;
 static int profileBackground =0x443a49;
 static int qr =0xFF020202;
 static int qrBackground =0x6F343232;
 static int logo =0xff443a49;
 static int logoBackground =0x443a49;
 static int underLine =0xff818182;

 static int backgroundTransparency =0xcbf1f3f5;
 static int selectedCardDesignBackground =0x9a9fd9ec;
 static int label1Background =0x2242324;
 static int label2Background =0x2242324;
 static int label3Background =0x2242324;
 static int label4Background =0x2242324;
 static int label5Background =0x2242324;
 static int label6Background =0x2242324;
 static int label7Background =0x2242324;
 static int text1Background =0x21d1d1d;
 static int text2Background =0x21d1d1d;
 static int text3Background =0x21d1d1d;
 static int text4Background =0x21d1d1d;
 static int text5Background =0x21d1d1d;
 static int text6Background =0x21d1d1d;
 static int text7Background =0x21d1d1d;

 static int lab1 =0xFD242324;
 static int lab2 =0xFD242324;
 static int lab3 =0xFD242324;
 static int lab4 =0xFD242324;
 static int lab5 =0xFD242324;
 static int lab6 =0xFD242324;
 static int lab7 =0xFD242324;
 static int txt1 =0xFD242324;
 static int txt2 =0xFD242324;
 static int txt3 =0xFD242324;
 static int txt4 =0xFD242324;
 static int txt5 =0xFD242324;
 static int txt6 =0xFD242324;
 static int txt7 =0xFD242324;
  static int underline1 =0xFD242324;
  static int underline2 =0xFD242324;
  static int underline3 =0xFD242324;
  static int underline4 =0xFD242324;
  static int underline5 =0xFD242324;
  static int underline6 =0xFD242324;
  static int underline7 =0xFD242324;

 static List<int> colorList=[0x6179e7e7,0x6fc124b2,0xaeae8e8];
}
///:SIZE Values
 class SizeValue{
  static double organizationText = 15.0;
  static double labels = 9.0;
  static double text = 11.0;
  static double profile = 55;
  static double qr = 48;
  static double logo = 20;
  static double underlineHeight1 = 0.7;
  static double underlineHeight2 = 0.7;
  static double underlineHeight3 = 0.7;
  static double underlineHeight4 = 0.7;
  static double underlineHeight5 = 0.7;
  static double underlineHeight6 = 0.7;
  static double underlineHeight7 = 0.7;
  static double underlineWidth1 = 100;
  static double underlineWidth2 = 100;
  static double underlineWidth3 = 100;
  static double underlineWidth4 = 100;
  static double underlineWidth5 = 100;
  static double underlineWidth6 = 100;
  static double underlineWidth7 = 100;
  static double organizationBoxWidth = 100;

  static double lab1 =9.0;
  static double lab2 =9.0;
  static double lab3 =9.0;
  static double lab4 =9.0;
  static double lab5 =9.0;
  static double lab6 =9.0;
  static double lab7 =9.0;
  static double txt1 =11.0;
  static double txt2 =11.0;
  static double txt3 =11.0;
  static double txt4 =11.0;
  static double txt5 =11.0;
  static double txt6 =11.0;
  static double txt7 =11.0;
 }
///:Horizontal position Values
class Dx{
 static double organization=80.0;
 static double defaultH=30.0;
 static double text = 15;
 static double labelText = 20;
 static double profile = 204;
 static double qr = 206;
 static double logo = 5.44;
 static double underLine = 20;
 static double label1 = 15;
 static double label2 = 15;
 static double label3 = 15;
 static double label4 = 15;
 static double label5 = 15;
 static double label6 = 15;
 static double label7 = 15;
}
///:Vertical position Values
class Dy{
 static double organization=120.0;

 static double defaultV=30.0;
static double text = 10;
static double labelText = 20;
static double profile = 92;
static double qr = 0.0;
static double logo = 127;
static double underLine = 30;

static double label1 = 85;
static double label2 = 50;
static double label3 = 15;

static double label4 = 110;
static double label5 = 80;
static double label6 = 50;
static double label7 = 20;}
///:Vertical Seekbar  Values
class VerticalSlider{
 static double organization = 70;
 static double profile = 57;
 static double qr = 0.0;
 static double logo = 75;

 static double lv1 = 40;
 static double lv2 = 35;
 static double lv3 = 20;
 static double lv4 = 50;
 static double lv5 = 80;
 static double lv6 = 50;
 static double lv7 = 20;
}
///:Horizontal  Seekbar Values
class HorizontalSlider{
 static double organization = 40;
 static double profile = 75;
 static double qr = 76;
 static double logo = 2;
 static double lv1 = 20;
 static double lv2 = 35;
 static double lv3 = 20;
 static double lv4 = 50;
 static double lv5 = 80;
 static double lv6 = 50;
 static double lv7 = 20;
}
///:Radius Values
class RadiusValue{

 static double organizationTopLeft = 3;
 static double organizationTopRight = 3;
 static double organizationBottomLeft = 3;
 static double organizationBottomRight = 3;

 static double profileTopLeft = 3;
 static double profileTopRight = 3;
 static double profileBottomLeft = 3;
 static double profileBottomRight = 3;
 static double logo = 2;
 static double logoTopLeft = 2;
 static double logoTopRight = 2;
 static double logoBottomLeft = 2;
 static double logoBottomRight = 2;
 static double underLine = 1;
 static double label1TopLeft = 3;
 static double label1TopRight = 3;
 static double label1BottomLeft = 3;
 static double label1BottomRight = 3;

 static double label2TopLeft = 3;
 static double label2TopRight = 3;
 static double label2BottomLeft = 3;
 static double label2BottomRight = 3;

 static double label3TopLeft = 3;
 static double label3TopRight = 3;
 static double label3BottomLeft = 3;
 static double label3BottomRight = 3;

 static double label4TopLeft = 3;
 static double label4TopRight = 3;
 static double label4BottomLeft = 3;
 static double label4BottomRight = 3;

 static double label5TopLeft = 3;
 static double label5TopRight = 3;
 static double label5BottomLeft = 3;
 static double label5BottomRight = 3;

 static double label6TopLeft = 3;
 static double label6TopRight = 3;
 static double label6BottomLeft = 3;
 static double label6BottomRight = 3;

 static double label7TopLeft = 3;
 static double label7TopRight = 3;
 static double label7BottomLeft = 3;
 static double label7BottomRight = 3;
}
///:Padding Values
///:fonts value
class FontsValue{
 static String lab1 =AppFonts.almaraiLight;
 static String txt1 =AppFonts.almaraiLight;
 static String lab2 =AppFonts.almaraiLight;
 static String txt2 =AppFonts.almaraiLight;
 static String lab3 =AppFonts.almaraiLight;
 static String txt3 =AppFonts.almaraiLight;
 static  String lab4 =AppFonts.almaraiLight;
 static  String txt4 =AppFonts.almaraiLight;
 static String lab5 =AppFonts.almaraiLight;
 static String txt5 =AppFonts.almaraiLight;
 static String lab6 =AppFonts.almaraiLight;
 static String txt6 =AppFonts.almaraiLight;
 static String lab7 =AppFonts.almaraiLight;
 static String txt7 =AppFonts.almaraiLight;
 static String organizationName =AppFonts.almaraiLight;
 static String label =AppFonts.almaraiLight;
 static String text =AppFonts.almaraiLight;

}
class PaddingValue{
 static  double profile = 1;
 static  double profileVertical = 1;
 static  double profileHorizontal = 1;
 static  double logo = 1;
 static  double organizationNameVertical = 1;
 static  double organizationNameHorizontal = 1;

 static  double logoVertical = 3;
 static  double logoHorizontal = 3;
 static  double underLine = 1;
 static  double label1 = 3;
 static  double label1Vertical = 3;
 static  double label1Horizontal = 3;
 static  double label2 = 3;
 static  double label2Vertical = 3;
 static  double label2Horizontal = 3;
 static  double label3 = 3;
 static  double label3Vertical = 3;
 static  double label3Horizontal = 3;
 static  double label4 = 3;
 static  double label4Vertical = 3;
 static  double label4Horizontal = 3;
 static  double label5 = 3;
 static  double label5Vertical = 3;
 static  double label5Horizontal = 3;
 static  double label6 = 3;
 static  double label6Vertical = 3;
 static  double label6Horizontal = 3;
 static  double label7 = 3;
 static  double label7Vertical = 3;
 static  double label7Horizontal = 3;
}
class RadiusPosition{
 static const String topLeft='TopLeft';
 static const String topRight='TopRight';
 static const String bottomLeft='BottomLeft';
 static const String bottomRight='BottomRight';


}
class PaddingPosition{
 static const String vertical='Vertical';
 static const String horizontal='Horizontal';

}
class CaseId{
static const textCaseId = 'textCaseId';
static const labelTextCaseId = 'labelTextCaseId';
static const profileCaseId = 'profileCaseId';
static const profileBackgroundCaseId = 'profileBackgroundCaseId';
static const qrCaseId = 'qrCaseId';
static const qrBackgroundCaseId = 'qrBackgroundCaseId';
static const logoCaseId = 'logoCaseId';
static const logoBackgroundCaseId = 'logoBackgroundCaseId';
static const underLineHeightCaseId = 'underLineHeightCaseId';
static const underLineWidthCaseId = 'underLineWidthCaseId';
static const backgroundTransparencyCaseId = 'BackgroundTransperancyCaseId';
static const backgroundCaseId = 'backgroundCaseId';
static const textAreaCaseId = 'textAreaCaseId';
static const organization = 'organization';
static const organizationtextcolor = 'organizationtextcolor';

static const label1CaseIdDefaultId = 'label1CaseIdDefaultId';
static const label1CaseId = 'label1CaseId';
static const label2CaseId = 'label2CaseId';
static const label3CaseId = 'label3CaseId';
static const label4CaseId = 'label4CaseId';
static const label5CaseId = 'label5CaseId';
static const label6CaseId = 'label6CaseId';
static const label7CaseId = 'label7CaseId';
static const text1CaseId = 'text1CaseId';
static const text2CaseId = 'text2CaseId';
static const text3CaseId = 'text3CaseId';
static const text4CaseId = 'text4CaseId';
static const text5CaseId = 'text5CaseId';
static const text6CaseId = 'text6CaseId';
static const text7CaseId = 'text7CaseId';

static const sizeCaseId = 'sizeCaseId';
static const horizontalMovementCaseId = 'horizontalMovementCaseId';
static const verticalMovementCaseId = 'verticalMovementCaseId';

}
//Todo:Text Box Style on a card
class TextBoxDesign{

 static String defaultValue=TextBoxStyle.allUpDown;
 static String lv1=TextBoxStyle.allUpDown;
 static String lv2=TextBoxStyle.allUpDown;
 static String lv3=TextBoxStyle.allUpDown;
 static String lv4=TextBoxStyle.allUpDown;
 static String lv5=TextBoxStyle.allUpDown;
 static String lv6=TextBoxStyle.allUpDown;
 static String lv7=TextBoxStyle.allUpDown;
}
class TextBoxStyle{
 static const String allUpDown='allUpDown';
 static const String onlyUpDown='onlyUpDown';
 static const String allRightLeft='allRightLeft';
 static const String onlyRightLeft='onlyRightLeft';
 static const String onlyValue='onlyValue';
}
class AppPosition{
  static Dy? vertical;
  static  Dx? horizontal;
  static  HorizontalSlider? sliderH;
  static  VerticalSlider? sliderV;
}
class AppFonts{
 static const almaraiBold='Almarai_b';
 static const almaraiRegular='Almarai_r';
 static const almaraiExtraBold='Almarai_xB';
 static const almaraiLight='Almarai_l';
 static const AbrilFatface='AbrilFatface';
 static const Anton='Anton';
 static const Architects='Architectsdaughter';
 static const Bangers='Bangers';
 static const BebasNeue='BebasNeue';
 static const BungeeShade='BungeeShade';
 static const CinzelRegular='CinzelRegular';
 static const CinzelExtraBold='CinzelExtraBold';
 static const CinzelBold='CinzelBold';
 static const CinzelMedium='CinzelMedium';
 static const CinzelSemiBold='CinzelSemiBold';
 static const CinzelVariable='CinzelVariablewght';
 static const CinzelDecorBlack='CinzelDecorBlack';
 static const CinzelDecorBold='CinzelDecorBold';
 static const CinzelDecorRegular='CinzelDecorRegular';
 static const ComfortaaRegular='ComfortaaRegular';
 static const ComfortaaLight='ComfortaaLight';
 static const ComfortaaMedium='ComfortaaMedium';
 static const ComfortaaSemiBold='ComfortaaSemiBold';
 static const Comfortaa_wght='Comfortaa_wght';
 static const CourgetteRegular='CourgetteRegular';
 static const DancingScriptRegular='DancingScriptRegular';
 static const DancingScriptSemiBold='DancingScriptSemiBold';
 static const DancingScriptBold='DancingScriptBold';
 static const DancingScriptVariableFont_wght='DancingScriptVariableFont_wght';



}