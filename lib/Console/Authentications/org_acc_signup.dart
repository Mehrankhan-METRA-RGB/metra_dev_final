import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import "package:http/http.dart" as http;
import '../../Contsants/app.dart';
import '../../Contsants/decorations.dart';
import '../../Databases/Boxes/Boxes.dart';
import '../../metra_startpage.dart';


class SignUpOwner extends StatefulWidget {
  @override
  _SignUpOwnerState createState() => _SignUpOwnerState();
}

class _SignUpOwnerState extends State<SignUpOwner> {
  var pass, confirmPass, name, address, postalCode, nic, phoneNo, email;
  late TextEditingController nameController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController postalCodeController = TextEditingController();
  late TextEditingController ownerNICController = TextEditingController();
  late TextEditingController phoneNoController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPassController = TextEditingController();

  // late bool error, sending, success;
  // late String msg;
  final signUpkey = GlobalKey<FormState>();
  String phpurl = "http://localhost:8080/signupOrg";
  // do not use http://localhost/ for your local
  // machine, Android emulation do not recognize localhost
  // insted use your local ip address or your live URL
  // hit "ipconfig" on Windows or  "ip a" on Linux to get IP Address

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    // error = false;
    // sending = false;
    // success = false;
    // msg = "";
    // nameController.addListener(() {
    //   setState(() {});
    // });
    // addressController.addListener(() {
    //   setState(() {});
    // });
    // postalCodeController.addListener(() {
    //   setState(() {});
    // });
    // ownerNICController.addListener(() {
    //   setState(() {});
    // });
    // phoneNoController.addListener(() {
    //   setState(() {});
    // });
    // emailController.addListener(() {
    //   setState(() {});
    // });
    // passwordController.addListener(() {
    //   setState(() {});
    // });
    // confirmPassController.addListener(() {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  void dispose() {
    // nameController.dispose();
    // addressController.dispose();
    // postalCodeController.dispose();
    // ownerNICController.dispose();
    // phoneNoController.dispose();
    // emailController.dispose();
    // passwordController.dispose();
    // confirmPassController.dispose();
    super.dispose();
  }

   sendData() async {
    var res = await http.post(Uri.parse(phpurl), body: {
      "name": name,
      "address": address,
      "postalCode": postalCode,
      "NIC": nic,
      "phoneNo": phoneNo,
      "email": email,
      "password": pass,
      "token":App.instance.createUserToken(nic)
    });
    // sending post request with header data
    print(res.statusCode);
    // if (res.statusCode == 200) {
    //   setState(() {
    //     nameController.text = "";
    //     addressController.text = "";
    //     postalCodeController.text = "";
    //     ownerNICController.text = "";
    //     phoneNoController.text = "";
    //     emailController.text = "";
    //     passwordController.text = "";
    //     sending = false;
    //     success = true; //mark success and refresh UI with setState
    //   });
    //   print(res.statusCode);
    //   return res.statusCode;
    // }
    // else {
    //   print(res.statusCode);
    //   setState(() {
    //     error = true;
    //     // ${res.body['sqlMessage']}
    //     msg = "Error during sending data.";
    //     sending = false;
    //     //mark error and refresh UI with setState
    //   });
    //   return res.statusCode;
    // }
    if (res.statusCode == 200) {

      if (Boxes.instance.consoleAuthBox.containsKey(Boxes.ConsoleAuthKey)) {
        Boxes.instance.consoleAuthBox.delete(Boxes.ConsoleAuthKey);}
      Boxes.instance.consoleAuthBox.put(Boxes.ConsoleAuthKey, res.body);
// print(authBox.get(Boxes.ConsoleAuthKey));
      print('auth data saved');
      return res.statusCode;
    }else{ return res.statusCode;}

  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Center(
          child: Form(
            key: signUpkey,
            child: Container(
              padding: EdgeInsets.only(bottom: 50),

              width: MediaQuery.of(context).size.width >=500?500: MediaQuery.of(context).size.width-20,
              child: Column(
                      children: [
                        // Text(
                        //   'Sign Up for an Organization',
                        //   style: TextStyle(
                        //
                        //     fontSize: 30,
                        //     fontFamily: AppFonts.CinzelMedium,
                        //   ),
                        // ),
                        AppTextField(
                          hintText: 'Name',
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          form: AppTextField.enable,
                          validator: (a) {
                            RegExp _numeric = new RegExp(r'^-?[a-zA-Z]+$');
                            // ignore: avoid_init_to_null
                            String? aa = null;
                            if (!_numeric.hasMatch(a!)) {
                              aa =
                                  'Numbers & Special character are not allowed in this field';
                            }
                            return aa;
                          },
                          onChange: (a) => setState(() {
                            name = a;
                          }),
                        ),
                        AppTextField(
                          hintText: 'Address',
                          keyboardType: TextInputType.streetAddress,
                          controller: addressController,
                          form: AppTextField.enable,
                          onChange: (a) => setState(() {
                            address = a;
                          }),
                        ),
                        AppTextField(
                          hintText: 'Postal Code',
                          keyboardType: TextInputType.text,
                          controller: postalCodeController,
                          form: AppTextField.enable,
                          onChange: (a) => setState(() {
                            postalCode = a;
                          }),
                        ),
                        AppTextField(
                          hintText: 'NIC',
                          keyboardType: TextInputType.number,
                          controller: ownerNICController,
                          form: AppTextField.enable,
                          validator: (a) {
                            RegExp _numeric = new RegExp(r'^-?[0-9]+$');
                            // ignore: avoid_init_to_null
                            String? aa = null;
                            if (!_numeric.hasMatch(a!)) {
                              print(a);
                              aa = 'Only Numeric data are allowed';
                            }
                            return aa;
                          },
                          onChange: (a) => setState(() {
                            nic = a;
                          }),
                        ),
                        AppTextField(
                          hintText: 'Phone Number',
                          keyboardType: TextInputType.phone,
                          controller: phoneNoController,
                          form: AppTextField.enable,
                          validator: (a) {
                            RegExp _numeric = new RegExp(r'^-?[0-9]+$');
                            // ignore: avoid_init_to_null
                            String? aa = null;
                            if (!_numeric.hasMatch(a!)) {
                              aa = 'Only numbers allowed in this field';
                            }
                            return aa;
                          },
                          onChange: (a) => setState(() {
                            phoneNo = a;
                          }),
                        ),
                        AppTextField(
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          form: AppTextField.enable,
                          validator: (a) {
                            RegExp _email = new RegExp(
                                r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
                            String? aa ;
                            if (!_email.hasMatch(a!)) {
                              aa =
                                  'Enter the Correct Email.  i.e : (abcd@domain.com)';
                            }
                            return aa;
                          },
                          onChange: (a) => setState(() {
                            email = a;
                          }),
                        ),
                        AppTextField(
                          hintText: 'Password',
                          keyboardType: TextInputType.text,
                          isPassword: true,
                          controller: passwordController,
                          form: AppTextField.enable,
                          validator: (a) {
                            /// RegExp(r'^(?=.*[0-9])(?=.*[a-zA-z])(?=.*[@#$%^&-+=()])(?=\\S+$).{8,20}$'); Hard
                            RegExp _numeric = new RegExp(
                                r'^(?=.*[0-9])(?=.*[a-zA-Z]).{8,20}$');

                            ///without characters
                            if (!_numeric.hasMatch(a!)) {
                              return "It contains at least 8 characters and at most 20 characters\nIt contains at least one digit.\nIt contains  upper or lower case alphabets.";
                            }
                            // ignore: todo
                            ///TODO:"WS://127.0.0.1:56789"
                            /// RegExp regExp = new RegExp(r"^WS{1,2}:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:56789");
                            return null;
                          },
                          onChange: (a) {
                            setState(() {
                              pass = a;
                              print(pass);
                            });
                          },
                        ),
                        AppTextField(
                          hintText: 'Confirm Password',
                          keyboardType: TextInputType.text,
                          isPassword: true,
                          controller: confirmPassController,
                          form: AppTextField.enable,
                          validator: (a) {
                            if (confirmPass != pass) {
                              return 'Password not matched';
                            }
                            return null;
                          },
                          onChange: (a) {
                            setState(() {
                              confirmPass = a;
                            });
                          },
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (signUpkey.currentState!.validate()) {

                                     sendData().then((value) {

                                     ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                       backgroundColor:value == 200?NeumorphicTheme.of(context)!.current!.baseColor:NeumorphicTheme.of(context)!.current!.baseColor,
                                        content: Container(width:MediaQuery.of(context).size.width >=800?800: MediaQuery.of(context).size.width-20,
                                          child: Text(
                                            value == 200
                                                ? "Account Created and Logged In "
                                                :value==409? "The NIC  is Already registered "
                                                :  "An unknown error occurred.",
                                            style: TextStyle(color:value == 200?NeumorphicTheme.of(context)!.current!.appBarTheme.textStyle!.color:Colors.red ),
                                          ),
                                        ),
                                     ));
                                       if(value==200){
                                       /// refresh start page with console route
                                       Navigator.pushReplacement(context, MaterialPageRoute( builder: (BuildContext context)=>AppStartPage(route:Boxes.instance.mainRouteBox.get(Boxes.MainRouteKey),),));

                                       }
                                     });


                                  }
                                },
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        )
                      ],
                    )

            ),
          ),
        ),
      );
  }
}
