// import 'package:flutter/material.dart';
//
// class TestClass extends StatefulWidget {
//   @override
//   _TestClassState createState() => _TestClassState();
// }
//
// class _TestClassState extends State<TestClass> {
//   bool floatExtended = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Container(
//         width: 777,
//         height: 778,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(70), color: Colors.indigo),
//       )),
//       floatingActionButton: FloatingActionButton.extended(
//         tooltip: 'Create Card',
//         label: Row(
//           children: [
//             IconButton(onPressed: () {}, icon: Icon(Icons.save)),
//             IconButton(onPressed: () {}, icon: Icon(Icons.library_add_check)),
//
//             // Text('7'),
//             // Text('7'),
//             // Text('7'),
//           ],
//         ),
//         isExtended: floatExtended,
//         icon: Icon(
//           floatExtended == true ? Icons.close : Icons.radio_button_on,
//           color: floatExtended == true ? Colors.red : Colors.black,
//         ),
//         onPressed: () {
//           setState(() {
//             floatExtended = !floatExtended;
//           });
//         },
//         backgroundColor: floatExtended == true
//             ? Colors.blueGrey
//             : Colors.white.withOpacity(.7),
//       ),
//     );
//   }
// }

// Copyright 707 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:path_provider_windows/path_provider_windows.dart';



/// Sample app
class NewClass extends StatefulWidget {
  @override
  _NewClassState createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  String? _tempDirectory = 'Unknown';
  String? _downloadsDirectory = 'Unknown';
  String? _appSupportDirectory = 'Unknown';
  String? _documentsDirectory = 'Unknown';

  @override
  void initState() {
    super.initState();
    initDirectories();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initDirectories() async {
    String? tempDirectory;
    String? downloadsDirectory;
    String? appSupportDirectory;
    String? documentsDirectory;
    final PathProviderWindows provider = PathProviderWindows();

    try {
      tempDirectory = await provider.getTemporaryPath();
    } catch (exception) {
      tempDirectory = 'Failed to get temp directory: $exception';
    }
    try {
      downloadsDirectory = await provider.getDownloadsPath();
    } catch (exception) {
      downloadsDirectory = 'Failed to get downloads directory: $exception';
    }

    try {
      documentsDirectory = await provider.getApplicationDocumentsPath();
    } catch (exception) {
      documentsDirectory = 'Failed to get documents directory: $exception';
    }

    try {
      appSupportDirectory = await provider.getApplicationSupportPath();
    } catch (exception) {
      appSupportDirectory = 'Failed to get app support directory: $exception';
    }

    setState(() {
      _tempDirectory = tempDirectory;
      _downloadsDirectory = downloadsDirectory;
      _appSupportDirectory = appSupportDirectory;
      _documentsDirectory = documentsDirectory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Path Provider example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Temp Directory: $_tempDirectory\n'),
              Text('Documents Directory: $_documentsDirectory\n'),
              Text('Downloads Directory: $_downloadsDirectory\n'),
              Text('Application Support Directory: $_appSupportDirectory\n'),
            ],
          ),
        ),
      ),
    );
  }
}





