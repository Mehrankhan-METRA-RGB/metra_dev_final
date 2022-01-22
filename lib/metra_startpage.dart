
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'Console/console.dart';
import 'Contsants/GlobalFunctions.dart';
import 'Contsants/app.dart';
import 'Databases/Boxes/Boxes.dart';
import 'Scanner/scanner_Route.dart';
import 'VirtualCard/virtualcard.dart';
import 'main.dart';

class AppStartPage extends StatefulWidget {
  final String? route;
  AppStartPage({this.route,});
  @override
  _AppStartPageState createState() => _AppStartPageState();
}

class _AppStartPageState extends State<AppStartPage> {

 var   popData=  ['Route','Logout','Theme'];
 var   popDataNames=  ['Route','Logout','Theme'];
  var _width;
  double _horMarginPadding = 10, _verticalwidth = 1;
  var buttonColor;
  var _route;

@override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Boxes.reOpenHiveBoxes();
    _route=widget.route;

  }
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    // _height = MediaQuery.of(context).size.height;
    buttonColor = NeumorphicTheme.of(context)!.current!.appBarTheme.color;
    return Scaffold(
        appBar: AppBar(elevation: 0,automaticallyImplyLeading:false,
          toolbarHeight: 50,
            title: Image.asset('assets/icons/meezar_logo.png',width: 80,height: 50,),
            // Text('Metra',style: NeumorphicTheme.of(context)!.current!.appBarTheme.textStyle ,),
          actions:[_route!=AppRoute.index?
          PopupMenuButton(
            initialValue: popData.length,
            child: Center(child: Icon(Icons.more_vert)),
            itemBuilder: (context) {
              return List.generate(popData.length, (index) {
                return PopupMenuItem(
                  value: index,
                  child: Text(popDataNames[index]),
                  onTap: () {
                    switch( popData[index]){
                      case 'Route':
                       setState((){_route=AppRoute.index;});
                       /// save route after navigating to particular route
                       Boxes.instance.mainRouteBox.put(Boxes.MainRouteKey, _route);
                        break;
                      // case FirstStageRoute.console:
                      //   setState((){_route=FirstStageRoute.console;});
                      //   break;
                      // case FirstStageRoute.virtualCard:
                      //   setState((){_route=FirstStageRoute.virtualCard;});
                      //   break;
                      case 'Logout':
                        Global.instance.logout(context,route: Boxes.instance.mainRouteBox.get(Boxes.MainRouteKey));
                        break;
                      case 'Theme':
                       setState((){currentTheme.switchTheme();}) ;
                        break;
                      default:
                        setState((){_route=AppRoute.index;});
                        Boxes.instance.mainRouteBox.put(Boxes.MainRouteKey, _route);
                        break;
                    }
                    // /// save route after navigating to particular route
                    // Boxes.instance.mainRouteBox.put(Boxes.MainRouteKey, _route);
                  },
                );
              });
            },
          ):Container(),],
          ),
      body:activePage(_route),
    );
  }
  Widget activePage(pageRoute){
    switch(pageRoute){
      case AppRoute.index:
        return indexPage();

      case AppRoute.console:
        return Console();

      case AppRoute.virtualCard:
        return VirtualCard();

      case AppRoute.scanner:
        return ScannerRoute();


      default :
        return indexPage();
    }

  }
Widget indexPage(){return  Container(
  // color: NeumorphicTheme.baseColor(context),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
        vertical: 5, horizontal: _horMarginPadding),
    child: SizedBox(
      width: _width >= 500 ? 500 : _width - 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          CupertinoButton(
            color: buttonColor,
            onPressed: () {
setState((){_route=AppRoute.virtualCard;});
Boxes.instance.mainRouteBox.put(Boxes.MainRouteKey, _route);


            },
            child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: _verticalwidth,
                    horizontal: _horMarginPadding),
                alignment: Alignment.center,
                child: Text(
                  'Virtual Card',
                  style: appButtonTextStyle(),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoButton(
            color: buttonColor,
            onPressed: () {
setState((){_route=AppRoute.scanner;});
            Boxes.instance.mainRouteBox.put(Boxes.MainRouteKey, _route);

            },
            child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: _verticalwidth,
                    horizontal: _horMarginPadding),
                alignment: Alignment.center,
                child: Text(
                  'Scanner',
                  style: appButtonTextStyle(),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoButton(
            color: buttonColor,
            onPressed: () {
              setState((){_route=AppRoute.console;});
              Boxes.instance.mainRouteBox.put(Boxes.MainRouteKey, _route);
            },
            child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: _verticalwidth,
                    horizontal: _horMarginPadding),
                alignment: Alignment.center,
                child: Text(
                  'Console ',
                  style: appButtonTextStyle(),
                )),
          ),
          Spacer(),
        ],
      ),
    ));}
  appButtonTextStyle() {
    return TextStyle(
      color: Colors.white70,
      wordSpacing: 3,
      letterSpacing: 1.3,
      fontSize: _width >= 500 ? 18 : 14,
    );
  }

 logout() {
  var _box=Boxes.instance.consoleAuthBox;
  ///delete data from db and navigate to index route (main page or index page)
  if(_box.containsKey(Boxes.ConsoleAuthKey)){
    _box.delete(Boxes.ConsoleAuthKey);
    setState((){_route=AppRoute.index;});
  }else  if(_box.containsKey(Boxes.VirtualCardAuthKey)) {
    _box.delete(Boxes.VirtualCardAuthKey);
    setState(() {
      _route = AppRoute.index;
    });
  }
  else  if(_box.containsKey(Boxes.ScannerAuthKey)) {
    _box.delete(Boxes.ScannerAuthKey);
    setState(() {
      _route = AppRoute.index;
    });
  }


  }
}








