import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'Contsants/app.dart';
import 'Contsants/Data.dart';
import 'Databases/Boxes/Boxes.dart';
import 'Theme/theme.dart';
import 'metra_startpage.dart';


 SelectTheme   currentTheme = SelectTheme();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Boxes.openHiveBoxes();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  MyApp({this.comp});
  final comp;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _route;
  double? appBarIconSize = 20;
  double? appBarFontSize = 20;
  double? headline1Size = 30;
  double? headline2Size = 30;
  double? headline3Size = 22;
  double? headline4Size = 22;
  double? headline5Size = 16;
  double? headline6Size = 14;

  double? subtitle1 = 11;
  double? subtitle2 = 11;
  double? bodyText1 = 14;
  double? bodyText2 = 14;
  double? buttonSize = 15;
  double? headline6TextSize = 16;
  // double? headline6Stize = AppSize.instance.width!>=500?16:12;

  @override
  void initState() {
    // : implement initState
    super.initState();
    // print('TSIZE:$headline6Stize ');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    currentTheme.addListener(() {
      setState(() {});
    });
    // if(!Boxes.instance.mainRouteBox.isOpen){Boxes.openHiveBoxes();}
    if (Boxes.instance.mainRouteBox.containsKey(Boxes.MainRouteKey)) {
      ///IF route is already saved in box then get route from box
      _route = Boxes.instance.mainRouteBox.get(Boxes.MainRouteKey);
    } else {
      ///save route in local storage & then assign to variable
      Boxes.instance.mainRouteBox.put(Boxes.MainRouteKey, AppRoute.index);
      _route = Boxes.instance.mainRouteBox.get(Boxes.MainRouteKey);
    }
  }
  @override
  dispose() {
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
    // _height=MediaQuery.of(context).size.height;
    // _width=MediaQuery.of(context).size.width;
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Meezar',
      themeMode: currentTheme.themeMode(),
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      home:
      AppStartPage(route: _route,),
      // TestHistory()
        //EDITOR()
      // TestResult(),
      // ScannerRoute(),
      // LoginScanner()
    );
  }

  NeumorphicThemeData _darkTheme(){
    return NeumorphicThemeData(
      baseColor: Color(0xFC2C2D2C),
      accentColor: Color(0xFC454582),
      disabledColor: Colors.white38,
      appBarTheme: NeumorphicAppBarThemeData(
          color: Color(0xFF424076),
          buttonPadding: EdgeInsets.all(4),
          iconTheme: IconThemeData(
            color:Colors.white70,
              size:20,
          ),
          buttonStyle: NeumorphicStyle(
            color: Color(0xFCBDC1BD),
          )),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Color(0xFFD1D5D1),
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiBold),
        headline2: TextStyle(
            color: Color(0xFF373837),
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiBold),
        headline3: TextStyle(
            color: Color(0xFFDCDCDE),
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.CinzelMedium),
        headline4: TextStyle(
            color: Color(0xFFD1D5D1),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiBold),
        headline5: TextStyle(
            color: Color(0xFFD1D5D1),
            fontSize: 13,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiBold),
        headline6: TextStyle(
            color: Color(0xFF373837),
            fontSize: 13,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.DancingScriptVariableFont_wght),
        subtitle1: TextStyle(
            color: Color(0xFFD1D5D1),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.DancingScriptVariableFont_wght),
        subtitle2: TextStyle(
            color: Color(0xFF373837),
            fontSize: 12,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.DancingScriptVariableFont_wght),
        bodyText1: TextStyle(
            color: Color(0xFFD1D5D1),
            fontSize: 13,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiLight),
        bodyText2: TextStyle(
            color: Color(0xFF373837),
            fontSize: 13,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiLight),
        button: TextStyle(
          // color: Color(0xFFCBD0CB),
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.CinzelRegular),
      ),
      buttonStyle: NeumorphicStyle(
        color: Color(0xF741D541),
      ),
      lightSource: LightSource.topLeft,
    );
  }
  NeumorphicThemeData _lightTheme(){
    return NeumorphicThemeData(
      baseColor: Color(0xFCFDFDFD),
      accentColor: Color(0xFF3D85C6),
      disabledColor: Colors.black26,
      appBarTheme: NeumorphicAppBarThemeData(

        /// icons: NeumorphicAppBarIcons(),
          textStyle: TextStyle(
            color: Color(0xFFDADADE),
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.Anton,
            fontSize: appBarFontSize,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            opacity: 0.9,
            size: appBarIconSize,
          ),
          color: Color(0xFF776ED0),
          buttonPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
          buttonStyle: NeumorphicStyle(
            color: Color(0xFC303130),
          )),
      textTheme: TextTheme(
        headline1: TextStyle(
            color: Color(0xFF252625),
            fontSize: headline1Size,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiBold),
        headline2: TextStyle(
            fontSize: headline1Size,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiBold),
        headline3: TextStyle(
            color: Color(0xFF373837),
            fontSize: headline3Size,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiBold),
        headline4: TextStyle(
            fontSize: headline4Size,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.CinzelMedium),
        headline5: TextStyle(
            color: Color(0xFF252625),
            fontSize: headline5Size,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiBold),
        headline6: TextStyle(
            color: Color(0xFF323232),
            fontSize: headline6Size,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.ComfortaaMedium),
        subtitle1: TextStyle(
            color: Color(0xFF323232),
            fontSize: subtitle1,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.ComfortaaMedium),
        subtitle2: TextStyle(
            color: Color(0xDF2F2F2F),
            fontSize: subtitle2,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.ComfortaaLight),
        bodyText1: TextStyle(
            color: Color(0xFF252625),
            fontSize: bodyText1,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiLight),
        bodyText2: TextStyle(
            color: Color(0xFFE6E6EA),
            fontSize: bodyText2,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.almaraiLight),
        button: TextStyle(
            color: Color(0xFFE0E5E5),
            fontSize: buttonSize,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontFamily: AppFonts.ComfortaaRegular),
      ),
      buttonStyle: NeumorphicStyle(
        color: Color(0xFC6C6CDC),
      ),
      lightSource: LightSource.topLeft,
    );
  }

}
