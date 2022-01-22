import 'dart:convert';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'Authentications/JWT.dart';
import 'Authentications/org_acc_sign_in.dart';
import 'Authentications/org_acc_signup.dart';
import 'dashboard.dart';

class Console extends StatefulWidget {
  @override
  _ConsoleState createState() => _ConsoleState();
}

class _ConsoleState extends State<Console> {
  var localAuth;
  var localToken;
  initial(){
    var a = JWT.getLocalConsoleAuth;
    if (a != null) {
      localAuth = a['secret'];
      localToken = a['account'][0]['token'];
    }
  }
  @override
  void initState() {
    super.initState();
    initial();
  }
  @override
  Widget build(BuildContext context) {
    if (localAuth != null) {
      ///If local auth Token is available
      var jwt = localAuth.toString().split(".");
      var payload1 =json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
      if (DateTime.fromMillisecondsSinceEpoch(payload1["exp"] * 1000).isAfter(DateTime.now()))
      {
        ///If token is not Expired
        ///call Dashboard
        return Dashboard();
      }else{
        ///If token is  Expired
        ///call console SignIn
        return console();
      }
    }else{
      ///If local auth Token is not available
      ///call console SignIn
      return console();
    }
  }
  Widget console(){return  DefaultTabController(
      length: 2,
      child: Scaffold(
    appBar:AppBar(
      toolbarHeight: 0,
      bottom: TabBar(
        tabs: [
          Tab(

              child: NeumorphicText(
                "Sign In",textStyle: NeumorphicTextStyle(fontSize: 14),

              )),
          Tab(

              child: NeumorphicText(
                "Sign Up",textStyle: NeumorphicTextStyle(fontSize: 14),

              )),
        ],
      ),),

    body: TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        // NameLogo(),
        SignIn(context),
        SignUpOwner(),


      ],
    ),







  )); }



}
