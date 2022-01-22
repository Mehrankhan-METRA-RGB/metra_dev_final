import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../Contsants/Data.dart';
import '../Contsants/app.dart';

import 'package:http/http.dart' as http;
import '../Databases/Boxes/Boxes.dart';
import '../metra_startpage.dart';
import 'Authentications/JWT.dart';
import 'Name_Logo.dart';
import 'UserList.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

Future<List<UserModel>> fetchUsers(token, companyName) async {
  var response = await http
      .get(Uri.parse('http://$androidLocalHost:8080/get/users/$token'));
  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);
    // print(response.body);
    return data.map((user) => UserModel.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load companies data');
  }
}

class _DashboardState extends State<Dashboard> {
  bool? isConnectionAvailable = false;
  bool? isErrorShowOnConnectionTimeOut = false;
  static var companyCount = 0;
  var localToken;
  var popData = ['Logout', 'More'];
  Future<List<CompanyModel>> fetchCompanyList(token) async {
    List? data;
    try {
      var res = await http.get(Uri.parse(
          'http://$androidLocalHost:8080/get/companies/$token')); // var a=jsonEncode(res.body);
      data = jsonDecode(res.body);

      ///Connection available
      isConnectionAvailable = true;
    } on SocketException {
      ///Connection not  available
      isConnectionAvailable = false;
      if (kDebugMode) {
        print('No Internet connection 😑');
      }

      /// show error in text field  after 4 seconds while have connection error
      Timer(const Duration(seconds: 4), () {
        setState(() {
          isErrorShowOnConnectionTimeOut = true;
        });
      });
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    }
    return data!.map((companies) => CompanyModel.fromJson(companies)).toList();
  }



  @override
  void initState() {

    super.initState();
    var _a=JWT.getLocalConsoleAuth;
    if ( _a!= null) {
      localToken = _a['account'][0]['token'];
      fetchCompanyList(localToken).then(
            (value) => setState(() {
          companyCount = value.length;
          ///we activated first company and saved its data in CurrentCompanyBox
          if (companyCount > 0) {
            Boxes.instance.currentCompanyBox.put(
                Boxes.CurrentCompanyKey, [value[0].id, value[0].companyName,value[0].logoUrl!.replaceAll('\\', '/')]);
          }
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          // FutureBuilder(
          //   future: http.read(
          //       Uri.parse('http://$android:8080/data'),
          //       headers: {"Authorization": data}),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Center(child: Text(payload1['email']));
          //     } else if (snapshot.hasError) {
          //       return Text('error occurred');
          //     } else {
          //       return CircularProgressIndicator();
          //     }
          //   },
          // ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(Boxes.instance.currentCompanyBox
                      .containsKey(Boxes.CurrentCompanyKey)
                  ?

                  ///  [1] is a position of company name in local database
                  Boxes.instance.currentCompanyBox
                      .get(Boxes.CurrentCompanyKey)[1]
                  : 'No company'),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  tooltip: 'Companies List',
                  onPressed: () {
                    companiesAlertBox(localToken);
                  },
                  icon: const Icon(Icons.list)),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: isConnectionAvailable!
          ?

          ///If companies are available then show dashboard-userList route else show register-company route
          companyCount > 0
              ? UserList(
                  ///[0] is a position of company primary id
                  company: Boxes.instance.currentCompanyBox
                      .get(Boxes.CurrentCompanyKey)[0]
                      .toString(),
                  token: localToken,
                )
              : NameLogo()
          : isErrorShowOnConnectionTimeOut!
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Connection Problem'),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppStartPage(
                                route: Boxes.instance.consoleAuthBox
                                    .get(Boxes.MainRouteKey),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Refresh',
                          style: NeumorphicTheme.of(context)!
                              .current!
                              .textTheme
                              .button,
                        ),
                        color: NeumorphicTheme.accentColor(context),
                      )
                    ],
                  ),
                )
              : Container(),
    );
  }

  companiesAlertBox(token) async {
    return App.alertBox(context,
        title: 'Companies List',
        widget: SizedBox(
          width: MediaQuery.of(context).size.width > 598
              ? 400
              : MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.0,
          child: FutureBuilder<List<CompanyModel>?>(
              future: fetchCompanyList(token),
              builder: (context, snapshot) {
                Color activeColor = NeumorphicTheme.of(context)!
                    .current!
                    .accentColor
                    .withOpacity(0.9);

                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data![index];
                          var imgurl = data.logoUrl!.replaceAll('\\', '/');
                          // print(imgurl);
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 2),
                            child: ListTile(
                                onTap: () {
                                  setState(() {
                                    ///Save current company information in list
                                    var _data = [data.id, data.companyName,data.logoUrl!.replaceAll('\\', '/')];
                                    print(jsonDecode(Boxes
                                            .instance.consoleAuthBox
                                            .get(Boxes.ConsoleAuthKey))[
                                        'account'][0]['token']);
                                    Boxes.instance.currentCompanyBox
                                        .put(Boxes.CurrentCompanyKey, _data);
                                  });
                                  Navigator.pop(context);
                                },
                                tileColor: Boxes.instance.currentCompanyBox
                                            .get(Boxes.CurrentCompanyKey)[0] ==
                                        data.id
                                    ? activeColor
                                    : NeumorphicTheme.of(context)!
                                        .current!
                                        .accentColor
                                        .withOpacity(0.5),
                                title: Row(
                                  children: [
                                    Container(
                                        child: Text(
                                      snapshot.data!.length > 0
                                          ? '${data.companyName} '
                                          : "empty",
                                      style: const TextStyle(fontSize: 14),
                                    )),
                                    const Spacer(),
                                    SizedBox(
                                      width: 35,
                                      child: ClipOval(
                                          child: Image.network(
                                        'http://$androidLocalHost:8080/$imgurl',
                                        width: 32,
                                        height: 32,
                                      )),
                                    ),
                                  ],
                                )),
                          );
                        });
                  } else if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child:   CircularProgressIndicator());
                  } else {
                    return const Center(child:   CircularProgressIndicator());
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text('Waiting connection..')
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                App.alertBox(context,
                    widget: NameLogo(), title: 'Register Company');
              },
              icon: const Icon(Icons.add)),
        ]);
  }
}
