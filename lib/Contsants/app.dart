import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:popup_menu/popup_menu.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as Slider;

import 'Data.dart';

class App{
  /// singleton class created
  App._private();
  static final  App instance=App._private();

  ///When user token Id is Created. It is used for a  Tables name in a database.
  /// Example:
  /// TableName: companies_0000009090_metra

  String createUserToken(userNIC){
   var nic= userNIC.toString();
   var _length=nic.length;
   var vl=nic.replaceRange((_length/2).round(),(_length/2).round()+2, '.');
    var split=vl.split('.');
    var token ='_${split[0]}_metra';
    return token;
  }

static alertBox(context,{Widget? widget,String? title=' ',bool?scrollable=false,EdgeInsets? margin=EdgeInsets.zero,EdgeInsets? contentPadding=const EdgeInsets.all(2),Widget? button,List<Widget>? actions}) async {

    return showDialog(
      builder: (context) => AlertDialog(
        backgroundColor:  NeumorphicTheme.baseColor(context),
        insetPadding: margin!,
        contentPadding:contentPadding!,
        title:Row(
          children: [
            Text(title!),Spacer(),button??Container()
          ],
        ),
        scrollable: scrollable!,
        content:widget,
        elevation: 2,
        actions: actions,
        actionsPadding: EdgeInsets.all(5),
      ),
      context: context,

    );



  }
  static bottomDialog(BuildContext context, {Widget? child})  {

    Slider.showSlideDialog(
      context: context,
      child: Container(
        decoration: BoxDecoration(border:Border(top:BorderSide(width: 0.5,color: Colors.black54)),
          color: NeumorphicTheme.currentTheme(context).baseColor,),

          child: child,
      ),
      barrierColor: NeumorphicTheme.currentTheme(context).baseColor.withOpacity(0.4),
      pillColor: NeumorphicTheme.currentTheme(context).accentColor,
      backgroundColor: NeumorphicTheme.currentTheme(context).baseColor,
    );
  }
static  offsetAlert(BuildContext context,{Offset? offset,List<MenuItemProvider>? items, buttonKey,Function(MenuItemProvider item)? onClickMenu,
  void Function()? onDismiss,Function(bool? isShow)? stateChanged}) {
  PopupMenu menu = PopupMenu(
     backgroundColor: NeumorphicTheme.accentColor(context),
     lineColor: NeumorphicTheme.baseColor(context),
    highlightColor: NeumorphicTheme.baseColor(context).withOpacity(0.5),
    context: context,
      maxColumn: 3,
      items:items!,
      // [
      //   MenuItem(title: 'Edit', image: Icon(Icons.edit,color: Colors.white,)),
      //   MenuItem(title: 'Delete', image: Icon(Icons.delete, color: Colors.white)),
      //   MenuItem(title: 'Update',image: Icon(Icons.update, color: Colors.white,)),
      // ],
      onClickMenu: onClickMenu,
      stateChanged: stateChanged,
      onDismiss: onDismiss);
 menu.show(rect: Rect.fromPoints(offset!, offset));
  // menu.show(widgetKey: buttonKey);
}
 static Widget drawer(BuildContext context,{List<Widget>? actions,double? width=70, dynamic color,double? actionPadding=30 }) {

    return Container(
      width: width,
      child: Drawer(
        child: Container(
          color:color ?? NeumorphicTheme.currentTheme(context).accentColor,
          padding:EdgeInsets.symmetric(vertical: actionPadding!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions!,

          ),
        ),
      ),
    );
  }


  static snackBar(context,{String? text,double? height=100,double? elevation= 5,int seconds=2,
  Color color=const Color(0xfd3766b3),Color textColor=const Color(0xfdf6f6f6)}){

    double _marginHorizontal=MediaQuery.of(context).size.width>=700?200:20;
    double _marginVertical=MediaQuery.of(context).size.width>=700?15:7;
    double _textSize=MediaQuery.of(context).size.width>=500?16:12;


    return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(   elevation: elevation!,
        duration:Duration(seconds:seconds ),
      margin: EdgeInsets.symmetric(vertical: _marginVertical,horizontal: _marginHorizontal),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      content: Container(

        // height: height!,
        child:Text(text!,textAlign: TextAlign.center,style: TextStyle(color:textColor,fontFamily: AppFonts.ComfortaaLight,fontSize: _textSize ),),


      )));

}
static button({
 required void Function()? onPressed,
  Key? key,
  required IconData? icon,
  String? toolTip='button',
  double? iconSize=20,
  bool? drawSurfaceAboveChild=false,
  EdgeInsets? padding=const EdgeInsets.all(5.0),
  Color? color=const Color(0xffffff),
  NeumorphicStyle? iconStyle=const NeumorphicStyle(color: Colors.black87,),
}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeumorphicButton(
        key: key,
        padding: padding!,
        tooltip: toolTip!,
        onPressed: onPressed!,
        drawSurfaceAboveChild: drawSurfaceAboveChild!,
        style: NeumorphicStyle(
          depth: 2,
          shape: NeumorphicShape
              .concave,
          shadowDarkColor:
          Colors.black87,
          color: color!,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        child: NeumorphicIcon(

          icon!,
          size: iconSize!,
          style: iconStyle!,
        ),
      ),
    );
}
static buttonIOS(BuildContext context,{
 required void Function()? onPressed,
  Key? key,
  EdgeInsetsGeometry? paddingButton=const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
  String? text,
  EdgeInsets? padding=const EdgeInsets.all(5.0),
  Color? color=const Color(0xffffff),

}){
    return CupertinoButton(
      padding: paddingButton!,
      color: color,
      onPressed: onPressed!,
      child:Text(
        text!,
            style: NeumorphicTheme.currentTheme(context).textTheme.button,
          ),
    );
}

static progress(BuildContext context,{double? total, double? current}){

    return  App.alertBox(context,widget: LinearProgressIndicator(value: current! ,),);
}




static  Widget tileText(BuildContext context,
    {required String? heading,
      required String? value,
      double? textScale=0.9,
      double? width,
      TextStyle? headingStyle,
      MainAxisAlignment? verticalAlignment=MainAxisAlignment.center,
      CrossAxisAlignment? horizontalAlignment=CrossAxisAlignment.start,
      TextStyle? valueStyle}) {
  return Container(width:width??null ,
    child: Column(
      crossAxisAlignment: horizontalAlignment!,
      mainAxisAlignment: verticalAlignment!,
      children: [
        SelectableText(
          heading!,
          textScaleFactor: textScale,
          style: headingStyle != null
              ? headingStyle
              : NeumorphicTheme.currentTheme(context).textTheme.subtitle1,
        ),
        SelectableText(
          value!,
          textScaleFactor: textScale,
          style: valueStyle != null
              ? valueStyle
              : NeumorphicTheme.currentTheme(context).textTheme.subtitle2,
        ),
        Divider(
          color: Colors.black.withOpacity(0.2),
          height: 9,
          thickness: 0.2,
        ),
      ],
    ),
  );
}



}
class AppRoute{
  static const String index='index';
  static const String virtualCard='virtualCard';
  static const String scanner='scanner';
  static const String console='console';
}