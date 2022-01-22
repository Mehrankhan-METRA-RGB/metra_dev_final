import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
 import '../Contsants/Data.dart';
import '../Contsants/app.dart';

import 'package:http/http.dart' as http;

import '../Contsants/decorations.dart';
import '../metra_startpage.dart';
import 'Authentications/JWT.dart';


class NameLogo extends StatefulWidget {
  @override
  _NameLogoState createState() => _NameLogoState();
}

class _NameLogoState extends State<NameLogo> {
  var _width, _height;
  late var aaa = 0xfffffff;
  var db, databaseFactory, text, name, file, extention, imagePath;
  // ignore: non_constant_identifier_names
  // var own_table = 'local_User';
  // // ignore: non_constant_identifier_names
  // var comp_table = 'local_companies';
  final logoNamekey = GlobalKey<FormState>();
  Future<List>? listdata;
  Future<Directory?>? provider;
  Future uploadData(imageFilePath, url) async {
    var _auth=JWT.getLocalConsoleAuth;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      imageFilePath,
      filename:
      'logo_${name.toString().hashCode}_${_auth['account'][0]['token']}_$extention',
    ));
    request.fields['companyName'] = name;
    request.fields['own_id'] = _auth['account'][0]['id'].toString();
    request.fields['nic'] = _auth['account'][0]['NIC'];
    request.fields['token'] = _auth['account'][0]['token'];
    var res = await request.send();
    return res.statusCode;
  }



  @override
  void initState() {
    // : implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return  SingleChildScrollView(
      child: Container(
            width: _width,
            height: _height,

            child: Form(
              key: logoNamekey,
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    width: _width >= 598 ? 598 : _width,
                    alignment: Alignment.center,
                    child: AppTextField(
                      hintText: 'Organization Name',
                      keyboardType: TextInputType.text,
                      // controller: nameController,
                      isPassword:false,
                      form: AppTextField.enable,
                      onChange: (a) {
                        setState(() {
                          name = a;
                        });
                      },
                      validator: (a) {
                        setState(() {});
                      },
                    ),
                  ),
                  Stack(
                    children: [
                       Padding(
                         padding:  EdgeInsets.all(_width >= 500?2.0:15),
                         child: Neumorphic(style: NeumorphicStyle(shape: NeumorphicShape.concave,boxShape:NeumorphicBoxShape.circle() ),
                           child: ClipOval(
                                  child:file == null
                  ? Image.asset(
                                        'assets/images/OIP.png',
                                        color: Colors.indigo.withOpacity(0.5),
                                        width: _width >= 500 ? 240  : 140,
                                        height: _width > 500 ? 240 : 140,
                                        fit: BoxFit.cover,
                                      )


                                :  Image.memory(file!.toUint8List(),
                                  width: _width >= 500 ? 240 : 140,
                                  height: _width > 500 ? 240 : 140,
                                      fit: BoxFit.fill),
      ),
                         ),
                       ),

          Positioned(bottom: 1,right: 1,child:
          NeumorphicButton(
            onPressed: () =>pickImage(),
            tooltip: 'Pick Image',
            drawSurfaceAboveChild: true,
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape
                  .circle(),
            ),
            padding: EdgeInsets.all(6.0),
            child: NeumorphicIcon(
              Icons.camera_alt,
              size: 20,
              style: NeumorphicStyle(
                  color: Colors.black,
                  depth: 4,
                  shape: NeumorphicShape
                      .concave,
                  shadowDarkColor:
                  Colors.black54),
            ),
          ),

      )

                    ],
                  ),
                  Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20.0, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          NeumorphicButton(
                            onPressed: () {Navigator.pop(context);},
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 10),
                                child: Text(
                                  'Back',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                          Spacer(),
                          NeumorphicButton(
                            onPressed: () {
                              if (logoNamekey.currentState!.validate()) {
                                uploadData(imagePath,
                                        'http://$androidLocalHost:8080/upload/company')
                                    .then((statusCode) {
                                  if (statusCode == 200) {
                                    print('Done');
                                    // Navigator.pop(context);
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => AppStartPage(route:AppRoute.console)));
                                  } else if (statusCode == 409) {
                                    print('Already Exist');
                                  } else if (statusCode == 401) {
                                    Navigator.pop(context);
                                    print(
                                        'only 5 companies are allowed to register');
                                  } else {
                                    print('Unknown error occurred');
                                  }

                                App.snackBar(context,text:statusCode == 200
                                    ? 'Your has been Company Registered'
                                    : statusCode == 409
                                    ? 'Already Registered'
                                    : statusCode == 401
                                    ? 'The companies limit cannot be exceed from 5'
                                    : 'Unknown error occurred',
                                   textColor: statusCode == 200
                                       ? Colors.black87
                                       : Colors.red,
                                   height: 60);

                                  // return UserList();

                                });
                              }


                            },
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 10),
                                child: Text(
                                  'Next',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                          Spacer(),
                        ],
                      )),
                  Spacer(),
                ],
              ),
            ),
          ),
    );
  }

  Future pickImage() async {
// show a dialog to open a file
    file = await FilePickerCross.importFromStorage(
        type: FileTypeCross
            .custom, // Available: `any`, `audio`, `image`, `video`, `custom`. Note: not available using FDE
        fileExtension:
            'png,jpg,jpeg' // Only if FileTypeCross.custom . May be any file extension like `dot`, `ppt,pptx,odp`
        );
    setState(() {
      if (file!.fileName.contains(file!.fileExtension.substring(0, 3))) {
        extention = '.${file!.fileExtension.substring(0, 3)}';
      } else if (file!.fileName.contains(file!.fileExtension.substring(4, 7))) {
        extention = '.${file!.fileExtension.substring(4, 7)}';
      } else if (file!.fileName
          .contains(file!.fileExtension.substring(8, 12))) {
        extention = '.${file!.fileExtension.substring(8, 12)}';
      }
      // print(extention);
      imagePath = file!.path;
    });
  }
}



class CompanyModel {
  final int? id;
  final String? companyName;
  final String? logoUrl;
  CompanyModel({this.companyName, this.id, this.logoUrl});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] as int,
      companyName: json['companyName'] as String,
      logoUrl: json['logoUrl'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'logoUrl': logoUrl,
    };
  }
}
