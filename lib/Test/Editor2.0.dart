import 'package:flip_card/flip_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:metra_dev/Test/streamContoller.dart';
import '../Console/Editor/Card.dart';
import '../Console/mailer/EmailSender.dart';
import '../Console/mailer/GoogleSignIn.dart';
import '../Contsants/Data.dart';
import '../Contsants/app.dart';
import '../Models/Models.dart';
import 'draggable.dart';

class EDITOR extends StatefulWidget {
  @override
  _EDITORState createState() => _EDITORState();
}

class _EDITORState extends State<EDITOR> {
  AppStream stream = AppStream();
  AppStream qrCodeStream = AppStream();
  // ignore: unused_field
  PositionCard _currentQRPosition = PositionCard();
  // ignore: unused_field
  PositionCard _currentLabelPosition = PositionCard();
  double? x = 100, y = 200;
  double? x1 = 100, y1 = 200;
  double? xx = 200, yy = 40;
  double? yAxis = 0.5;
  double? xAxis = 0.5;
  double temp = 0;
  // ignore: unused_field
  Matrix4 _matrix = Matrix4(
    1, 0, 0, 0, //
    0, 1, 0, 0,
    0, 0, 1, 0,
    0, 0, 0, 1,
  );
  double _baseScaleFactor = 1.0;
  double _scaleFactor = 1.0;

  double _baseAngleFactor = 0;
  double _angleFactor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          App.buttonIOS(
            context,
            onPressed: () {
              // EmailSender


              // Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailSender()));
            },
            text: 'Save',
          ),
          App.buttonIOS(
            context,
            onPressed: () {
              // EmailSender

              App.alertBox(context,
                  widget: EmailSender(),
                  scrollable: true,
                  actions: [
                    App.buttonIOS(
                      context,
                      text: 'Logout',
                      onPressed: () => GoogleAuthApi.signOut(),
                    )
                  ]);
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailSender()));
            },
            text: 'Test',
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: SizedBox(
          width: AppCard.cardWidth,
          height: AppCard.cardHeight,
          child:FlipCard(
            front: Neumorphic(
            style: NeumorphicStyle(
                depth: 3, color: Colors.redAccent.withOpacity(0.3)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppDraggable(
                  caseId: CaseId.organization,
                  offset: Offset(20, 30),
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.organization;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.organization
                      ? true
                      : false,
                  child: Text(
                    'organization',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                AppDraggable(
                  caseId: CaseId.profileCaseId,
                  offset: Offset(20, 30),
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.profileCaseId;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.profileCaseId
                      ? true
                      : false,
                  child: Text(
                    'Profile',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                AppDraggable(
                  offset: Offset(40, 60),
                  caseId: CaseId.logoCaseId,
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.logoCaseId;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.logoCaseId
                      ? true
                      : false,
                  child: Text(
                    'logo',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                AppDraggable(
                  offset: Offset(40, 60),
                  caseId: CaseId.label1CaseId,
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.label1CaseId;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.label1CaseId
                      ? true
                      : false,
                  child: Text(
                    'Label 1',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                AppDraggable(
                  offset: Offset(40, 70),
                  caseId: CaseId.label2CaseId,
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.label2CaseId;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.label2CaseId
                      ? true
                      : false,
                  child: Text(
                    'Label 2',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                AppDraggable(
                  offset: Offset(40, 60),
                  caseId: CaseId.label3CaseId,
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.label3CaseId;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.label3CaseId
                      ? true
                      : false,
                  child: Text(
                    'Label 3',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                AppDraggable(
                  offset: Offset(40, 60),
                  caseId: CaseId.label4CaseId,
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.label4CaseId;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.label4CaseId
                      ? true
                      : false,
                  child: Text(
                    'Label 4',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                AppDraggable(
                  offset: Offset(40, 60),
                  caseId: CaseId.label5CaseId,
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.label5CaseId;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.label5CaseId
                      ? true
                      : false,
                  child: Text(
                    'Label 5',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                AppDraggable(
                  offset: Offset(40, 60),
                  caseId: CaseId.label6CaseId,
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.label6CaseId;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.label6CaseId
                      ? true
                      : false,
                  child: Text(
                    'Label 6',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                AppDraggable(
                  offset: Offset(40, 60),
                  caseId: CaseId.label7CaseId,
                  onTap: () {
                    setState(() {
                      AppDefault.widgetIdCarrier = CaseId.label7CaseId;
                    });
                  },
                  isWidgetSelected:
                  AppDefault.widgetIdCarrier == CaseId.label7CaseId
                      ? true
                      : false,
                  child: Text(
                    'Label 7',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
            back: Neumorphic(
              style: NeumorphicStyle(
                  depth: 3, color: Colors.redAccent.withOpacity(0.3)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppDraggable(
                    caseId: CaseId.organization,
                    offset: Offset(20, 30),
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.organization;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.organization
                        ? true
                        : false,
                    child: Text(
                      'organization',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  AppDraggable(
                    caseId: CaseId.profileCaseId,
                    offset: Offset(20, 30),
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.profileCaseId;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.profileCaseId
                        ? true
                        : false,
                    child: Text(
                      'Profile',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  AppDraggable(
                    offset: Offset(40, 60),
                    caseId: CaseId.logoCaseId,
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.logoCaseId;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.logoCaseId
                        ? true
                        : false,
                    child: Text(
                      'logo',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  AppDraggable(
                    offset: Offset(40, 60),
                    caseId: CaseId.label1CaseId,
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.label1CaseId;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.label1CaseId
                        ? true
                        : false,
                    child: Text(
                      'Label 1',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  AppDraggable(
                    offset: Offset(40, 70),
                    caseId: CaseId.label2CaseId,
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.label2CaseId;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.label2CaseId
                        ? true
                        : false,
                    child: Text(
                      'Label 2',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  AppDraggable(
                    offset: Offset(40, 60),
                    caseId: CaseId.label3CaseId,
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.label3CaseId;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.label3CaseId
                        ? true
                        : false,
                    child: Text(
                      'Label 3',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  AppDraggable(
                    offset: Offset(40, 60),
                    caseId: CaseId.label4CaseId,
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.label4CaseId;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.label4CaseId
                        ? true
                        : false,
                    child: Text(
                      'Label 4',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  AppDraggable(
                    offset: Offset(40, 60),
                    caseId: CaseId.label5CaseId,
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.label5CaseId;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.label5CaseId
                        ? true
                        : false,
                    child: Text(
                      'Label 5',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  AppDraggable(
                    offset: Offset(40, 60),
                    caseId: CaseId.label6CaseId,
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.label6CaseId;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.label6CaseId
                        ? true
                        : false,
                    child: Text(
                      'Label 6',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  AppDraggable(
                    offset: Offset(40, 60),
                    caseId: CaseId.label7CaseId,
                    onTap: () {
                      setState(() {
                        AppDefault.widgetIdCarrier = CaseId.label7CaseId;
                      });
                    },
                    isWidgetSelected:
                    AppDefault.widgetIdCarrier == CaseId.label7CaseId
                        ? true
                        : false,
                    child: Text(
                      'Label 7',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ),
          ) ,

        ),
      ),
    );
  }

  // ///This will apply draggable movement according to CaseId
  // _scale(caseId, {required DragUpdateDetails scale}) {
  //   // yAxis=(yAxis!+ scale.delta.dy);
  //   // xAxis=(xAxis!+ scale.delta.dx);
  //
  //     switch (caseId) {
  //       case CaseId.label1CaseId:
  //         Dy.label1+= scale.delta.dy;
  //         Dx.label1+=scale.delta.dx;
  //
  //
  //         stream.positionSink.add(
  //             PositionCard(
  //               dx: Dx.label1,
  //               dy:Dy.label1,
  //             ) ) ;
  //         print('Label:${Dx.label1} | ${Dy.label1}');
  //
  //
  //         break;
  //       case CaseId.qrCaseId:
  //
  //         ///Save current position
  //         Dy.qr+=scale.delta.dy;
  //         Dx.qr+=scale.delta.dx;
  //
  //         qrCodeStream.positionQRSink.add(
  //             PositionCard(
  //               dx: Dx.qr,
  //               dy:Dy.qr,
  //             )  ) ;
  //         print('QR:${Dy.qr} | ${Dx.qr}');
  //
  //         break;
  //     }
  //
  // }

  // ignore: unused_element
  _angle(ScaleUpdateDetails scale) {
    _scaleFactor = _baseScaleFactor * scale.scale;
    _angleFactor = _baseAngleFactor + scale.rotation;

    // var angleMatrix = Matrix4.identity();
    // angleMatrix[0] = angleMatrix[5] = math.cos(_angleFactor);
    // angleMatrix[1] = math.sin(_angleFactor);
    // angleMatrix[4] = math.sin(_angleFactor);
    //
    // var scaleMatrix = Matrix4.identity();
    // scaleMatrix[0] = scaleMatrix[5] = _scaleFactor;
    //
    // _matrix = angleMatrix * scaleMatrix;
  }
}
