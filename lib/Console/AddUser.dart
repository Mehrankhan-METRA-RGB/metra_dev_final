
// ignore: import_of_legacy_library_into_null_safe

import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../Contsants/Data.dart';
import '../Contsants/app.dart';


import 'dart:async';

import '../Contsants/decorations.dart';
import '../metra_startpage.dart';
import 'Authentications/JWT.dart';

class UserAdd extends StatefulWidget {
  final currentCompany;
  final title;
  final token;
  UserAdd({this.currentCompany,this.token,this.title});
  @override
  _UserAddState createState() => _UserAddState();
}

class _UserAddState extends State<UserAdd> {
  late TextEditingController nameController;
  late TextEditingController roleController;
  late TextEditingController addressController;
  late TextEditingController postalCodeController;
  late TextEditingController ownerNICController;
  late TextEditingController phoneNoController;
  late TextEditingController emailController;
  late TextEditingController dobController;
  late TextEditingController qualificationController;
  late TextEditingController nationalityController;
  late TextEditingController genderController;
  FilePickerCross? file;
  String? imagePath;
  late String formatedDate = '';
  List gender = ["Male", "Female", "Other"];
  Object? selectedGender;
  late bool error, sending, success;
  late String msg;
  final signUpkey = GlobalKey<FormState>();
  String phpurl = "http://$androidLocalHost/reg";
  var qualification,
      nationality,
      name,
      address,
      postalCode,
      nic,
      phoneNo,
      email,
      role,
      checknic,
      extention;
  List? companies=[];
  bool checkupload = true;
var  companyDefault;
  final addUserKey = GlobalKey<FormState>();
  var _height, _width;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    nameController = TextEditingController();
    roleController = TextEditingController();
    addressController = TextEditingController();
    postalCodeController = TextEditingController();
    ownerNICController = TextEditingController();
    phoneNoController = TextEditingController();
    emailController = TextEditingController();
    dobController = TextEditingController();
    qualificationController = TextEditingController();
    nationalityController = TextEditingController();
    genderController = TextEditingController();
 ///get companies from web and assign to companies variable
// JsonWebToken.companylist(widget.token).then((value) =>value.forEach((element) {setState((){companies!.add(element.companyName) ;});print(element.companyName);}));

    
    nameController.addListener(() {
      setState(() {});
    });
    addressController.addListener(() {
      setState(() {});
    });
    postalCodeController.addListener(() {
      setState(() {});
    });
    ownerNICController.addListener(() {
      setState(() {});
    });
    phoneNoController.addListener(() {
      setState(() {});
    });
    emailController.addListener(() {
      setState(() {});
    });
    dobController.addListener(() {
      setState(() {});
    });
    qualificationController.addListener(() {
      setState(() {});
    });
    nationalityController.addListener(() {
      setState(() {});
    });
    genderController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    nameController.dispose();
    roleController.dispose();
    addressController.dispose();
    postalCodeController.dispose();
    ownerNICController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
    dobController.dispose();
    qualificationController.dispose();
    nationalityController.dispose();
    genderController.dispose();

    super.dispose();
  }


  Future uploadImage(imageFilePath, url) async {
    var token = JWT.getLocalConsoleAuth;
    print('Current Company : ${widget.currentCompany}');
    // var token=await  JsonWebToken.getCompaniesData.then((value) => value[0]['company_id'].toString());
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      imageFilePath,
      filename:
          '${postalCode}_${DateFormat("yyyyMMdd").format(DateTime.now())}_$nic$extention',
    ));
    request.fields['name'] = name;
    request.fields['company_id'] = widget.currentCompany.toString();
    request.fields['role'] = role;
    request.fields['address'] = address;
    request.fields['postalCode'] = postalCode;
    request.fields['NIC'] = nic;
    request.fields['phoneNo'] = phoneNo;
    request.fields['email'] = email;
    request.fields['dob'] = formatedDate.toString();
    request.fields['qualification'] = qualification;
    request.fields['nationality'] = nationality;
    request.fields['gender'] = selectedGender.toString();
    request.fields['token'] = token['account'][0]['token'];

    var res = await request.send();
    if (res.statusCode == 200) {
      print(res.statusCode);
      return res.statusCode;
    } else {
      print(res.statusCode);
      return res.reasonPhrase;
    }

  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar: AppBar(actions: [Row(crossAxisAlignment: CrossAxisAlignment.center,children: [Text('Add user to ${widget.title}',style: NeumorphicTheme.currentTheme(context).appBarTheme.textStyle,),SizedBox(width: 15,)],)],),
      body: Container(
          width: _width,
          height: _height ,
          decoration: BoxDecoration(color: NeumorphicTheme.currentTheme(context).baseColor),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80,top: 20),
            scrollDirection: Axis.vertical,
            child: Form(
              key: addUserKey,
              child: Column(
                children: [
                  ///width > 598
                  _width > 598.0
                      ? Container(
                          width: _width > 598.0 ? 598.0 : _width,
                          // alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 10,
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Neumorphic(
                                    margin: EdgeInsets.all(10),
                                    child: file == null
                                        ? Image.asset(
                                            'assets/images/OIP.png',
                                            width: _width > 598 ? 150 : 90,
                                            height: _height > 598 ? 180 : 100,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.memory(file!.toUint8List(),
                                            width: _width > 598 ? 150 : 90,
                                            height: _height > 598 ? 180 : 100,
                                            fit: BoxFit.cover),
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(10)),
                                      depth: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  App.buttonIOS(context,
                                    onPressed: () => pickImage(),
                                    text:
                                      'Pick Image',
                                    color: NeumorphicTheme.accentColor(context),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width:
                                    _width > 598.0 ? 598.0 - 200 : _width - 141,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Column(
                                    children: [
                                      AppTextField(
                                        hintText: 'Full Name',
                                        form: true,
                                        validator: (a) {
                                          setState(() {});
                                        },
                                        onChange: (a) => setState(() {
                                          name = a;
                                        }),
                                      ),
                                      AppTextField(
                                        hintText: 'Role',
                                        form: true,
                                        validator: (a) {
                                          setState(() {});
                                        },
                                        onChange: (a) => setState(() {
                                          role = a;
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )

                      ///width  < 598
                      : Container(
                          width: _width > 598.0 ? 598.0 : _width,
                          // alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 10,
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Neumorphic(
                                    margin: EdgeInsets.all(10),
                                    child: file == null
                                        ? Image.asset(
                                            'assets/images/OIP.png',
                                            width: 100,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.memory(file!.toUint8List(),
                                            width: 100,
                                            height: 120,
                                            fit: BoxFit.cover),
                                    style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(10)),
                                      depth: 9,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  App.buttonIOS(context,
                                    onPressed: () => pickImage(),
                                    text:
                                    'Pick Image',
                                    color: NeumorphicTheme.accentColor(context),

                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AppTextField(
                                hintText: 'Full Name',
                                form: true,
                                validator: (a) {
                                  setState(() {});
                                },
                                onChange: (a) => setState(() {
                                  name = a;
                                }),
                              ),
                              AppTextField(
                                hintText: 'Role',
                                form: true,
                                validator: (a) {
                                  setState(() {});
                                },
                                onChange: (a) => setState(() {
                                  role = a;
                                }),
                              ),
                            ],
                          ),
                        ),

                  Container(
                    width: _width > 598.0 ? 598.0 : _width,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        AppTextField(
                          hintText: 'CNIC',
                          keyboardType: TextInputType.number,
                          form: true,
                          validator: (a) {
                            setState(() {});
                          },
                          onChange: (a) => setState(() {
                            nic = a;
                          }),
                        ),
                        AppTextField(
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          form: true,
                          validator: (a) {
                            setState(() {});
                          },
                          onChange: (a) => setState(() {
                            email = a;
                          }),
                        ),
                        AppTextField(
                          hintText: 'Address',
                          form: true,
                          validator: (a) {
                            setState(() {});
                          },
                          onChange: (a) => setState(() {
                            address = a;
                          }),
                        ),
                        AppTextField(
                          hintText: 'Postal code',
                          form: true,
                          validator: (a) {
                            setState(() {});
                          },
                          onChange: (a) => setState(() {
                            postalCode = a;
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: IntlPhoneField(
                            keyboardType: TextInputType.number,
                            countryCodeTextColor: NeumorphicTheme.of(context)!
                                .current!
                                .textTheme
                                .bodyText1!
                                .color,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: NeumorphicTheme.of(context)!
                                      .current!
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                  fontSize: 16),
                              fillColor: NeumorphicTheme.of(context)!
                                  .current!
                                  .accentColor
                                  .withOpacity(0.6),
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'PK',
                            onChanged: (phone) {
                              setState(() {
                                phoneNo = phone.completeNumber;
                                for (var country in countries) {
                                  if (country['code']
                                      .contains(phone.countryISOCode!)) {
                                    nationality = country['name'];
                                    // print()
                                  }
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: _width > 598.0 ? 598.0 : _width,
                          padding: EdgeInsets.symmetric(
                            vertical: 18.0,
                            horizontal: 10,
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 18.0,
                            horizontal: 0,
                          ),
                          decoration: BoxDecoration(
                            color: NeumorphicTheme
                                .baseColor(context)
                                .withOpacity(0.6),
                            border: Border.all(width: 0.5, color: Colors.black87),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            nationality ?? 'COUNTRY',
                            style: TextStyle(
                              fontSize: 16,
                              color: NeumorphicTheme.currentTheme(context)
                                  .textTheme
                                  .bodyText1!
                                  .color,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          decoration: BoxDecoration(
                            color: NeumorphicTheme
                                .baseColor(context)
                                .withOpacity(0.6),
                            border: Border.all(width: 0.5, color: Colors.black87),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          // padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CupertinoButton(
padding: EdgeInsets.symmetric(horizontal: 20),
                              onPressed: () => _showDatePicker(),
                              child: Container(
                                height: 60,
                                width: _width > 598.0 ? 598.0 : _width,


                                child: Row(
                                  children: [
                                    Text(
                                      'DOB',
                                      style: TextStyle(
                                        fontSize: _width > 598.0 ? 20 : 12,
                                        color:
                                            NeumorphicTheme.currentTheme(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                      ),
                                    ),
                                    SizedBox(
                                      width: _width > 598.0 ? 20 : 10,
                                    ),
                                    Icon(
                                      Icons.date_range,
                                      size: _width > 598.0 ? 28 : 18,
                                      color: NeumorphicTheme.currentTheme(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                    Spacer(),
                                    Text(
                                      formatedDate != ''
                                          ? formatedDate
                                          : 'YY/MM/DD',
                                      style: TextStyle(
                                        fontSize: _width > 598.0 ? 20 : 12,
                                        color:
                                            NeumorphicTheme.currentTheme(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                          child: _width > 598.0
                              ? Row(
                                  children: <Widget>[
                                    Text(
                                      'Select Gender',
                                      style: TextStyle(
                                        fontSize: _width > 598.0 ? 20 : 16,
                                        color:
                                            NeumorphicTheme.currentTheme(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                      ),
                                    ),
                                    Spacer(),
                                    addRadioButton(0, 'Male'),
                                    addRadioButton(1, 'Female'),
                                    addRadioButton(2, 'Others'),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Select Gender',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color:
                                            NeumorphicTheme.currentTheme(context)
                                                .textTheme
                                                .bodyText1!
                                                .color,
                                      ),
                                    ),
                                    Divider(),
                                    addRadioButton(0, 'Male'),
                                    addRadioButton(1, 'Female'),
                                    addRadioButton(2, 'Others'),
                                  ],
                                ),
                        ),
                       //  DropdownButton(items:List.generate(companies!.length, (index) {
                       //
                       // return  DropdownMenuItem(child: Text(companies![index]),);
                       //
                       //
                       //
                       //  }),value:companyDefault ,onChanged: (a)=>companyDefault=a, ),
                        AppTextField(
                          hintText: 'Qualification',
                          form: true,
                          validator: (a) {
                            setState(() {});
                          },
                          onChange: (a) => setState(() {
                            qualification = a;
                          }),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 100,),
                  Container(
                      width: _width >= 598.0 ? 598.0 : _width,
                      padding:
                          EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                        App.buttonIOS(context, onPressed: ()=> Navigator.pop(context),text:'Back',color: NeumorphicTheme.accentColor(context),paddingButton:EdgeInsets.symmetric(horizontal: 20) ),
                          Spacer(),
                          App.buttonIOS(context, onPressed: () {
                            if (addUserKey.currentState!.validate()) {
                              uploadImage(imagePath,
                                  'http://$androidLocalHost:8080/adduserdata')
                                  .then((resCode) {
                                App.snackBar(
                                    context,
                                    text:resCode == 200
                                        ? 'Registering...'
                                        : resCode == 409
                                        ? 'NIC: ( $nic ) is already Registered'
                                        : 'Unknown error',
                                    textColor: resCode == 200
                                        ? Colors.white
                                        : Colors.redAccent


                                );
                                if(resCode == 200){
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AppStartPage(route:'console',)));
                                }
                              }
                              );
                            }
                          } ,text:'Register',color: NeumorphicTheme.accentColor(context),paddingButton:EdgeInsets.symmetric(horizontal: 20) ),


                          Spacer(),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
    );
  }

  Future pickImage() async {
// show a dialog to open a result
    file = await FilePickerCross.importFromStorage(
        type: FileTypeCross
            .custom, // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
        fileExtension:
            'png,jpg,jpeg' // Only if resultTypeCross.custom . May be any result extension like `dot`, `ppt,pptx,odp`
        );
    setState(() {
      if (file!.fileName!.contains(file!.fileExtension.substring(0, 3))) {
        extention = '.${file!.fileExtension.substring(0, 3)}';
      } else if (file!.fileName!.contains(file!.fileExtension.substring(4, 7))) {
        extention = '.${file!.fileExtension.substring(4, 7)}';
      } else if (file!.fileName!
          .contains(file!.fileExtension.substring(8, 12))) {
        extention = '.${file!.fileExtension.substring(8, 12)}';
      }
      print(extention);
      imagePath = file!.path;
    });
  }
// Future _pickImage()async{
//     List<String>? ext=['jpg','jpeg','png',];
//   FilePickerResult? result = await FilePicker.platform.pickFiles(type:FileType.image, );
//
//   if (result != null) {
//     // result.files.first.extension;
//     Uint8List? fileBytes = result.files.first.bytes;
//     String? fileName = result.files.first.name;
//     setState(() {
//       if (fileName.contains(ext[0])) {
//         extention = '.${ext[0]}';
//       } else if (fileName.contains(ext[1])) {
//         extention = '.${ext[1]}';
//       } else if (fileName.contains(ext[2])) {
//         extention = '.${ext[2]}';
//       }
//       print(extention);
//       imagePath = result.files.first.path;
//     });
//     // Upload result
//
//   }
// }
  Future<void> _showDatePicker() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950, 8),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        formatedDate = DateFormat("yyyy/MM/dd").format(picked);
      });
      print(formatedDate);
    }
  }

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            child: Radio(
          activeColor: NeumorphicTheme.accentColor(context),
          value: gender[btnValue],
          groupValue: selectedGender,
          onChanged: (dynamic value) {
            setState(() {
              selectedGender = value;
              print(selectedGender);
            });
          },
        )),
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: NeumorphicTheme.currentTheme(context)
                  .textTheme
                  .bodyText1!
                  .color),
        )
      ],
    );
  }
}
