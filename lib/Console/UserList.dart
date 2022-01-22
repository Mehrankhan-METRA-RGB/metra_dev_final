import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Contsants/Data.dart';
import '../Contsants/GlobalFunctions.dart';
import '../Contsants/app.dart';
import 'package:http/http.dart' as http;
import '../Databases/Boxes/Boxes.dart';
import '../Models/Models.dart';
import 'AddUser.dart';
import 'GuardsList.dart';
import 'Authentications/JWT.dart';
import 'CardDesigns.dart';
import 'CreateAndSave/RepaintBoundaries.dart';
import 'CreateAndSave/multiCardsMethods.dart';
import 'Editor/CardEditor.dart';
import 'Editor/CardMethods.dart';
import 'Name_Logo.dart';
import 'console.dart';

class UserList extends StatefulWidget {
  UserList({this.company, this.token});
  final company;
  final token;

  static var compIndex = 0;
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool floatExtended = false;
  bool check = false;
  double? _width;
  TextStyle? valueStyle, expansionChildHeadingStyle, expansionHeadingStyle;
  Future<List<UserModel>> fetchUsers(token, companyPrimaryKey) async {
    var response = await http
        .get(Uri.parse('http://$androidLocalHost:8080/get/users/$token'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      ///filter users by current company
      List? filteredList = [];
      for (var user in data) {
        if (user['company_id'] ==
            Boxes.instance.currentCompanyBox.get(Boxes.CurrentCompanyKey)[0]) {
          filteredList.add(user);
        }
      }

      /// returned filtered list
      return filteredList.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load companies data');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  double? _textScale;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    valueStyle = NeumorphicTheme.currentTheme(context).textTheme.subtitle2;
    expansionChildHeadingStyle =
        NeumorphicTheme.currentTheme(context).textTheme.subtitle1;
    expansionHeadingStyle =
        NeumorphicTheme.currentTheme(context).textTheme.headline6;
    _textScale = _width! >= 500 ? 1.1 : 0.7;
    return Scaffold(
      endDrawer: _drawer(context),
      body: Container(
          alignment: Alignment.center,
          child: Container(
            width: _width! >= 600 ? 600 : _width,
            child: FutureBuilder<List<UserModel>?>(
              builder: (context, snapshot) {
                var snapShot = snapshot.data;
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: EdgeInsets.only(bottom: 50, top: 10),
                      itemCount: (snapshot.data!).length,
                      itemBuilder: (context, position) {
                        return _userListTile(data: snapShot![position]);
                      });
                } else if (!snapshot.hasData) {
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return _onError(error: snapshot.error);
                }

                // By default, show a loading spinner.
                return Center(
                    child: CircularProgressIndicator(
                  semanticsLabel: 'Loading...',
                ));
              },
              future: fetchUsers(
                widget.token,
                widget.company,
              ),
            ),
          )),
    );
  }

  Widget _onError({error}) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Console()),
                );
              },
              child: Text('Refresh'),
            ),
            SizedBox(
              height: 30,
            ),
            Text("$error"),
          ],
        ));
  }

  Widget _userListTile({UserModel? data}) {
    var img = data!.imageUrl!.replaceAll('\\', '/');
    return Neumorphic(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      style: NeumorphicStyle(depth: 3),
      child: ExpansionTile(
          leading: ClipOval(
            child: Image.network(
              'http://$androidLocalHost:8080/$img',
              width: 45,
              height: 45,
            ),
          ),
          title: Row(
            children: [
              Text(
                data.name!,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textScaleFactor: _textScale,
                textWidthBasis: TextWidthBasis.longestLine,
                style: expansionHeadingStyle,
              ),

              Spacer(),

              ///green tick will be shown when we generate a card for a user
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: (data.decoration) == null
                      ? Color(0xfcfcfc)
                      : Color(0xee36a522),
                  size: 20,
                ),
              ),
            ],
          ),
          subtitle: Row(
            children: [
              Text(
                data.NIC!,
                textScaleFactor: _textScale,
                style: valueStyle,
              ),
              Spacer(),
              App.button(
                  onPressed: () {
                    // UserModel? _data = data[position];
                    // print('${_data.toJson()}');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RepaintCard(
                              user: CardCredentials(
                                  id: data.id,
                                  lv1: Lv(label: 'Name', value: data.name),
                                  lv2: Lv(label: 'Role', value: data.role),
                                  lv3:
                                      Lv(label: 'Identity No', value: data.NIC),
                                  lv4: Lv(
                                      label: 'Phone No', value: data.phoneNo),
                                  lv5: Lv(label: 'Email ', value: data.email),
                                  lv6: Lv(
                                      label: 'Qualification ',
                                      value: data.qualification),
                                  lv7: Lv(
                                      label: 'Address ', value: data.address),
                                  orgName: Boxes.instance.currentCompanyBox
                                      .get(Boxes.CurrentCompanyKey)[1],
                                  profile: img,

                                  ///[2] contains logo URL in local box
                                  logo: Boxes.instance.currentCompanyBox
                                      .get(Boxes.CurrentCompanyKey)[2],
                                  decoration:

                                      ///get String Card with a specific key from local storage Convert it card CardModel
                                      Boxes.instance.activatedCardBox.isNotEmpty
                                          ? Methods.instance.encodedJsonToCard(
                                              Boxes.instance
                                                  .savedLocalCardListBox
                                                  .get(Boxes
                                                      .instance.activatedCardBox
                                                      .get(Boxes
                                                          .ActivatedCardKey))!
                                                  .details!)
                                          : null,
                                  company: CompanyModel(
                                    id: Boxes.instance.currentCompanyBox
                                        .get(Boxes.CurrentCompanyKey)[0],
                                    companyName: Boxes
                                        .instance.currentCompanyBox
                                        .get(Boxes.CurrentCompanyKey)[1],
                                    logoUrl: Boxes.instance.currentCompanyBox
                                        .get(Boxes.CurrentCompanyKey)[2],
                                  ),
                                  qrCode: Global.instance
                                      .qrEncryptor(userId: data.id),
                                  code: data.NIC),
                              name: data.name!)),
                    );
                  },
                  toolTip: 'Generate Card',
                  icon: Icons.credit_card),
            ],
          ),
          children: [
            Divider(
              color: Colors.black.withOpacity(0.2),
              height: 9,
              thickness: 0.2,
            ),
            tileText(heading: 'Role', value: data.role),
            tileText(heading: 'Qualification', value: data.qualification),
            tileText(heading: 'Country', value: data.nationality),
            tileText(heading: 'Address', value: data.address),
            tileText(heading: 'CNIC', value: data.NIC),
            tileText(heading: 'DOB', value: data.dob),
            Row(
              children: [
                tileText(heading: 'Email', value: data.email),
                Spacer(),
                App.button(
                    onPressed: () => _createVCToken(context, user: data),
                    toolTip: 'Email',
                    icon: Icons.email_outlined,
                    iconStyle: NeumorphicStyle(color: Colors.redAccent),
                    drawSurfaceAboveChild: true),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Divider(
              color: Colors.black.withOpacity(0.2),
              height: 9,
              thickness: 0.2,
            ),
            Row(
              children: [
                tileText(heading: 'Phone', value: data.phoneNo),
                Spacer(),
                App.button(
                    onPressed: () {},
                    toolTip: 'Phone Call',
                    icon: Icons.call,
                    iconStyle: NeumorphicStyle(color: Colors.green),
                    drawSurfaceAboveChild: true),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Divider(
              color: Colors.black.withOpacity(0.2),
              height: 9,
              thickness: 0.2,
            ),
            Row(
              children: [
                Spacer(),
                App.button(
                    onPressed: () {
                      // _emailSend(context,user:_data);
                    },
                    icon: Icons.edit_rounded,
                    toolTip: 'Edit'),
                Spacer(),
                App.button(
                    onPressed: () => _createVCToken(context, user: data),
                    icon: Icons.security,
                    toolTip: 'Virtual Card Authentication token'),
                Spacer(),
              ],
            )
          ],
          tilePadding: EdgeInsets.all(8),
          childrenPadding:
              EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 28),
          expandedAlignment: Alignment.centerLeft),
    );
  }

 void _createVCToken(BuildContext context, {UserModel? user}) {
    final random = Random();
    int min = 10000;
    int max = 99999;
    var _pin = min + random.nextInt(max - min);
    // print('PIN:$_pin');
    var _token = jsonDecode(
            Boxes.instance.consoleAuthBox.get(Boxes.ConsoleAuthKey))['account']
        [0]['token'];
    var _compId =
        Boxes.instance.currentCompanyBox.get(Boxes.CurrentCompanyKey)[0];
    var encoded = JWT.encodeJWT({
      'uid': user!.id,
      'cid': _compId,
      'token': _token,
      'pin': _pin,
    });
    Clipboard.setData(
            ClipboardData(text: jsonEncode({'Token': encoded, 'PIN': _pin})))
        .whenComplete(
      () => App.snackBar(context, text: 'Token and Pin copied to clipboard',seconds: 2),
    );
    // print(JWT.decodeJWT(encoded));
    // return EmailSender(
    //   recipient: user.email,
    //   body:{'token':encoded,'PIN':_pin,'name':user.name},
    // );
  }

  // ignore: unused_element
  Future _generateCompanyToken(BuildContext context) async {
    var token = jsonDecode(await Boxes.instance.consoleAuthBox
        .get(Boxes.ConsoleAuthKey))['account'][0]['token'];

    var companyId =
        await Boxes.instance.currentCompanyBox.get(Boxes.CurrentCompanyKey)[0];
    Map<String, dynamic> _json = {'companyId': companyId, 'token': token};

    var endcode = JWT.encodeJWT(_json);
    print(endcode);
    var decode = JWT.decodeJWT(endcode);
    print(decode);
    Clipboard.setData(new ClipboardData(text: endcode));
    App.snackBar(context, text: 'Generating Token');
  }

  Widget _drawer(BuildContext context) {
    return  App.drawer(
        context,
        actions: [
      SizedBox(height: 30,),
      IconButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Guards())),
        // App.alertBox(context,
        // actions: [IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close,color: NeumorphicTheme.currentTheme(context).iconTheme.color,))],
        // widget: Guards(), scrollable: true),
        icon: Icon(
          Icons.security,
          color: NeumorphicTheme.currentTheme(context)
              .appBarTheme
              .iconTheme!
              .color,
        ),
        tooltip: 'Registered security guards'
        ,
      ),
      Spacer(),
      IconButton(
        onPressed: () {
          print(DateTime.now());
          // print('month:${DateTime.now().toString().substring(5,7)}');
          // print('day:${DateTime.now().toString().substring(8,11)}');
          // print('year:${DateTime.now().toString().substring(0,4)}');
          // print('Time:${DateTime.now().toString().substring(11,19)}');
        },
        icon: Icon(
          Icons.text_snippet,
          color: NeumorphicTheme.currentTheme(context)
              .appBarTheme
              .iconTheme!
              .color,
        ),
        tooltip: 'Test Button',
      ),
      IconButton(
        onPressed: () => MultiCards.instance.show(context),
        icon: Icon(
          Icons.picture_as_pdf,
          color: NeumorphicTheme.currentTheme(context)
              .appBarTheme
              .iconTheme!
              .color,
        ),
        tooltip: 'Generated cards',
      ),
      IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CardEditor()));
        },
        icon: Icon(
          Icons.edit_rounded,
          color: NeumorphicTheme.currentTheme(context)
              .appBarTheme
              .iconTheme!
              .color,
        ),
        tooltip: 'Create New Card ',
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardDesigns(
                  size: 0.8,
                  onChange: (a) {
                    setState(() {});
                  },
                )),
          );
        },
        icon: Icon(
          Icons.sd_storage,
          color: NeumorphicTheme.currentTheme(context)
              .appBarTheme
              .iconTheme!
              .color,
        ),
        tooltip: 'Saved Cards',
      ),
      IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserAdd(
            currentCompany: widget.company,
            token: widget.token,
            title: Boxes.instance.currentCompanyBox.get(Boxes.CurrentCompanyKey)[1],
          )));
        },
        icon: Icon(
          Icons.add,
          color: NeumorphicTheme.currentTheme(context)
              .appBarTheme
              .iconTheme!
              .color,
        ),
        tooltip: 'Add Users',
      ),
      SizedBox( height: 30,),
        ]);
  }

  Widget tileText(
      {required String? heading,
      required String? value,
      TextStyle? headingStyle,
      TextStyle? valueStyle}) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          heading!,
          textScaleFactor: _textScale,
          style: headingStyle != null
              ? headingStyle
              : NeumorphicTheme.currentTheme(context).textTheme.subtitle1,
        ),
        SelectableText(
          value!,
          textScaleFactor: _textScale,
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
    );
  }
}

class UserModel {
  final int? id;
  final String? name;
  final String? role;
  final String? companyName;
  final int? companyId;
  // ignore: non_constant_identifier_names
  final String? NIC;
  final String? email;
  final String? dob;
  final String? address;
  final String? qualification;
  final String? nationality;
  final String? phoneNo;
  final String? postalCode;
  final String? gender;
  final String? imageUrl;
  final String? decoration;
  UserModel(
      {this.email,
      this.phoneNo,
      this.postalCode,
      // ignore: non_constant_identifier_names
      this.NIC,
      this.companyName,
      this.companyId,
      this.address,
      this.name,
      this.id,
      this.gender,
      this.role,
      this.nationality,
      this.qualification,
      this.dob,
      this.decoration,
      this.imageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
      companyName: json['companyName'] as String,
      address: json['address'] as String,
      postalCode: json['postalCode'] as String,
      NIC: json['NIC'] as String,
      phoneNo: json['phoneNo'] as String,
      email: json['email'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      qualification: json['qualification'] as String,
      nationality: json['nationality'] as String,
      decoration: json['decoration'],
      imageUrl: json['imageUrl'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phoneNo': phoneNo,
      'postalCode': postalCode,
      'NIC': NIC,
      'companyName': companyName,

      ///company_id instead of companyId because in database the column name is company_id.
      'company_id': companyId,
      'address': address,
      'name': name,
      'id': id,
      'gender': gender,
      'role': role,
      'nationality': nationality,
      'qualification': qualification,
      'dob': dob,
      'decoration': decoration,
      'imageUrl': imageUrl,
    };
  }
}
