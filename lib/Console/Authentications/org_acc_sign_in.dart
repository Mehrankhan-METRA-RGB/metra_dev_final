
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Contsants/Data.dart';
import '../../Contsants/app.dart';
import '../../Contsants/colors.dart';
import '../../Contsants/decorations.dart';
import '../../Databases/Boxes/Boxes.dart';
import '../../metra_startpage.dart';

class SignIn extends StatefulWidget {
  final BuildContext? context;
  SignIn(this.context);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // PathProviderWindows provider = PathProviderWindows();
  var db, databaseFactory, text, _email, _password;
  Future<List>? listdata;

  Future attemptLogIn(String email, String password) async {
var authBox=Boxes.instance.consoleAuthBox;

    var res = await http.post(Uri.parse("http://$androidLocalHost:8080/ownsignIn"),
        body: {"email": email, "password": password});
  print('Login response : ${res.body}');
    if (res.statusCode == 200) {
/// when login successful server will respond with authentication code
      if (authBox.containsKey(Boxes.ConsoleAuthKey)) {
        authBox.delete(Boxes.ConsoleAuthKey);}
      authBox.put(Boxes.ConsoleAuthKey, res.body);
// print(authBox.get(Boxes.ConsoleAuthKey));
      print('auth data saved');
    return res.statusCode;
  }else{ return res.statusCode;}

  }

double? _width;

  @override
  Widget build(BuildContext context) {
    _width=MediaQuery.of(context).size.width > 598
        ? 598
        : MediaQuery.of(context).size.width;
    return  Form(
        child: Container(padding: EdgeInsets.symmetric(horizontal: 10),
          width: _width,
          // height: MediaQuery.of(context).size.height-44,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: _width,
                child: AppTextField(
                  hintText: 'Email',
                  keyboardType: TextInputType.text,
                  // controller: nameController,
                  form: AppTextField.enable,
                  onChange: (a) {
                    setState(() {
                      _email = a;
                    });
                  },
                  validator: (a) {
                    setState(() {});
                  },
                ),
              ),
              Container(width: _width,
                child: AppTextField(
                  hintText: 'password',
                  keyboardType: TextInputType.text,
                  // controller: nameController,
                  form: AppTextField.enable,
                  isPassword: true,
                  onChange: (a) {
                    setState(() {
                      _password = a;
                    });
                  },
                  validator: (a) {
                    setState(() {});
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () async {
                    await attemptLogIn(_email, _password).then((value) {
                      if (value == 200) {
                        /// refresh start page with console route
                         Navigator.pushReplacement(context, MaterialPageRoute( builder: (BuildContext context)=>AppStartPage(route:AppRoute.console,)));


                      } else {



                      }
                    });
                  },
                  color: Colors.blueAccent,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: white80, fontSize: 25),
                    ),
                  ),
                ),
              ),



            ],
          ),
        ),
      );
  }

  void displayDialog(
          {required context,
          required title,
          required text,
          color = Colors.black87}) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            backgroundColor: AppDefault.backgroundApp,
            title: Text(
              title,
            ),
            content: Text(
              text,
              style: TextStyle(color: color),
            )),
      );
}
