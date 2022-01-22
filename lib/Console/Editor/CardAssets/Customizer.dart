import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../../Contsants/Data.dart';
import 'CardFonts.dart';
import 'ColorPicker.dart';
import 'RPS.dart';
import 'TextBoxDesigns.dart';
import 'conditions.dart';

class Customizer extends StatefulWidget {
  final ValueChanged<dynamic>? onChange;
  final width;

  Customizer({
    required this.onChange,
    this.width,
  });
  @override
  _CustomizerState createState() => _CustomizerState();
}

class _CustomizerState extends State<Customizer> {
  var _height, _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return customizer();
  }

  Widget customizer() {
    return Column(
      children: [
        Container(

          margin: EdgeInsets.only(top: 5, left: 10, bottom: 2),


          child: NeumorphicText(
            AppDefault.widgetIdCarrier == CaseId.profileCaseId
                ? 'Profile Edit'
                : AppDefault.widgetIdCarrier == CaseId.logoCaseId
                    ? 'Logo Edit'
                    : AppDefault.widgetIdCarrier == CaseId.qrCaseId
                        ? 'QR-Code Edit'
                        : AppDefault.widgetIdCarrier == CaseId.label1CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label2CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label3CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label4CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label5CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label6CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label7CaseId
                            ? 'Text Edit'
                            : AppDefault.widgetIdCarrier ==
                                    CaseId.backgroundTransparencyCaseId
                                ? 'Background Edit'
                                : 'No item selected on card',
            style: NeumorphicStyle(
              depth: 2,
              shape: NeumorphicShape.convex,
              shadowDarkColor: Color(0xed020202), //customize depth here
              shadowLightColor: Colors.white,
              color: NeumorphicTheme.currentTheme(context).textTheme.bodyText1!.color, //customize color here
            ),
            textStyle: NeumorphicTextStyle(

              fontSize: 16, //customize size
              // AND others usual text style properties (fontFamily, fontWeight, ...)
            ),
          ),
        ),
        allButtons(),
      ],
    );
  }

  allButtons({double cardDepth = 4}) {
    return Container(
        width: _width >= 500 ? 500-70 : _width - 70,
        child:

            ///Profile
            AppDefault.widgetIdCarrier == CaseId.profileCaseId
                ? Column(
                    children: [
                      _roundWidget(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Color & Size'),
                          SizedBox(
                            height: 20,
                          ),
                          ColorsPop(
                            caseId: CaseId.profileCaseId,
                            onChanged: (a) {
                              setState(() {
                                Conditions.colorValue(
                                    caseId: CaseId.profileCaseId,
                                    onchangeCallbackValue: a,
                                    returnType: Conditions.onchange);
                                callback();
                              });
                            },
                            background: true,
                            tooltip: 'Profile background Color',
                          ),
                          RPSlider(
                            sliderReturnType: RPSlider.size,
                            position: 'Size',
                            onChanged: (val) {
                              setState(() {
                                Conditions.sizeSliderValue(
                                    caseId: CaseId.profileCaseId,
                                    onchangeCallbackValue: val,
                                    conditionReturnType: Conditions.onchange);
                              });
                              callback();
                            },
                            caseId: CaseId.profileCaseId,
                            max: 80,
                            min: 35,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )),
                      _roundWidget(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Radius'),
                            RPSlider(
                              onChanged: (val) {
                                setState(() {
                                  Conditions.radiusSliderValue(
                                      caseId: CaseId.profileCaseId,
                                      position: RadiusPosition.topLeft,
                                      returnType: Conditions.onchange,
                                      onchangeCallbackValue: val);
                                });
                                callback();
                              },
                              caseId: CaseId.profileCaseId,
                              sliderReturnType: RPSlider.radius,
                              position: RadiusPosition.topLeft,
                            ),
                            RPSlider(
                              onChanged: (val) {
                                setState(() {
                                  Conditions.radiusSliderValue(
                                      caseId: CaseId.profileCaseId,
                                      position: RadiusPosition.topRight,
                                      returnType: Conditions.onchange,
                                      onchangeCallbackValue: val);
                                });
                                callback();
                              },
                              caseId: CaseId.profileCaseId,
                              sliderReturnType: RPSlider.radius,
                              position: RadiusPosition.topRight,
                            ),
                            RPSlider(
                              onChanged: (val) {
                                setState(() {
                                  Conditions.radiusSliderValue(
                                      caseId: CaseId.profileCaseId,
                                      position: RadiusPosition.bottomLeft,
                                      returnType: Conditions.onchange,
                                      onchangeCallbackValue: val);
                                });
                                callback();
                              },
                              caseId: CaseId.profileCaseId,
                              sliderReturnType: RPSlider.radius,
                              position: RadiusPosition.bottomLeft,
                            ),
                            RPSlider(
                              onChanged: (val) {
                                setState(() {
                                  Conditions.radiusSliderValue(
                                      caseId: CaseId.profileCaseId,
                                      position: RadiusPosition.bottomRight,
                                      returnType: Conditions.onchange,
                                      onchangeCallbackValue: val);
                                });
                                callback();
                              },
                              caseId: CaseId.profileCaseId,
                              sliderReturnType: RPSlider.radius,
                              position: RadiusPosition.bottomRight,
                            ),
                          ],
                        ),
                      ),
                      _roundWidget(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Padding'),
                            RPSlider(
                              sliderReturnType: RPSlider.padding,
                              position: PaddingPosition.vertical,
                              onChanged: (val) {
                                setState(() {
                                  Conditions.paddingSliderValue(
                                      caseId: CaseId.profileCaseId,
                                      returnType: Conditions.onchange,
                                      orientation: PaddingPosition.vertical,
                                      onchangeCallbackValue: val);
                                });
                                callback();
                              },
                              caseId: CaseId.profileCaseId,
                            ),
                            RPSlider(
                              sliderReturnType: RPSlider.padding,
                              position: PaddingPosition.horizontal,
                              onChanged: (val) {
                                setState(() {
                                  Conditions.paddingSliderValue(
                                      caseId: CaseId.profileCaseId,
                                      returnType: Conditions.onchange,
                                      orientation: PaddingPosition.horizontal,
                                      onchangeCallbackValue: val);
                                });
                                callback();
                              },
                              caseId: CaseId.profileCaseId,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )

                ///logo
                : AppDefault.widgetIdCarrier == CaseId.logoCaseId
                    ? Column(
                        children: [
                          _roundWidget(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Color & Size'),
                                SizedBox(
                                  height: 20,
                                ),
                                ColorsPop(
                                  caseId: CaseId.logoCaseId,
                                  onChanged: (a) {
                                    setState(() {
                                      Conditions.colorValue(
                                          caseId: CaseId.logoCaseId,
                                          onchangeCallbackValue: a,
                                          returnType: Conditions.onchange);
                                    });
                                    callback();
                                  },
                                  background: true,
                                  tooltip: 'Logo Background Color',
                                ),
                                RPSlider(
                                  sliderReturnType: RPSlider.size,
                                  onChanged: (val) {
                                    setState(() {
                                      Conditions.sizeSliderValue(
                                          caseId: CaseId.logoCaseId,
                                          onchangeCallbackValue: val,
                                          conditionReturnType:
                                              Conditions.onchange);
                                    });
                                    callback();
                                  },
                                  caseId: CaseId.logoCaseId,
                                  max: 60,
                                  min: 20,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          _roundWidget(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Radius'),
                                RPSlider(
                                  onChanged: (val) {
                                    setState(() {
                                      Conditions.radiusSliderValue(
                                          caseId: CaseId.logoCaseId,
                                          position: RadiusPosition.topLeft,
                                          returnType: Conditions.onchange,
                                          onchangeCallbackValue: val);
                                    });
                                    callback();
                                  },
                                  caseId: CaseId.logoCaseId,
                                  sliderReturnType: RPSlider.radius,
                                  position: RadiusPosition.topLeft,
                                ),
                                RPSlider(
                                  onChanged: (val) {
                                    setState(() {
                                      Conditions.radiusSliderValue(
                                          caseId: CaseId.logoCaseId,
                                          position: RadiusPosition.topRight,
                                          returnType: Conditions.onchange,
                                          onchangeCallbackValue: val);
                                    });
                                    callback();
                                  },
                                  caseId: CaseId.logoCaseId,
                                  sliderReturnType: RPSlider.radius,
                                  position: RadiusPosition.topRight,
                                ),
                                RPSlider(
                                  onChanged: (val) {
                                    setState(() {
                                      Conditions.radiusSliderValue(
                                          caseId: CaseId.logoCaseId,
                                          position: RadiusPosition.bottomLeft,
                                          returnType: Conditions.onchange,
                                          onchangeCallbackValue: val);
                                    });
                                    callback();
                                  },
                                  caseId: CaseId.logoCaseId,
                                  sliderReturnType: RPSlider.radius,
                                  position: RadiusPosition.bottomLeft,
                                ),
                                RPSlider(
                                  onChanged: (val) {
                                    setState(() {
                                      Conditions.radiusSliderValue(
                                          caseId: CaseId.logoCaseId,
                                          position: RadiusPosition.bottomRight,
                                          returnType: Conditions.onchange,
                                          onchangeCallbackValue: val);
                                    });
                                    callback();
                                  },
                                  caseId: CaseId.logoCaseId,
                                  sliderReturnType: RPSlider.radius,
                                  position: RadiusPosition.bottomRight,
                                ),
                              ],
                            ),
                          ),
                          _roundWidget(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Padding'),
                                RPSlider(
                                  sliderReturnType: RPSlider.padding,
                                  position: PaddingPosition.vertical,
                                  onChanged: (val) {
                                    setState(() {
                                      Conditions.paddingSliderValue(
                                          caseId: CaseId.logoCaseId,
                                          returnType: Conditions.onchange,
                                          orientation: PaddingPosition.vertical,
                                          onchangeCallbackValue: val);
                                    });
                                    callback();
                                  },
                                  caseId: CaseId.logoCaseId,
                                ),
                                RPSlider(
                                  sliderReturnType: RPSlider.padding,
                                  position: PaddingPosition.horizontal,
                                  onChanged: (val) {
                                    setState(() {
                                      Conditions.paddingSliderValue(
                                          caseId: CaseId.logoCaseId,
                                          returnType: Conditions.onchange,
                                          orientation:
                                              PaddingPosition.horizontal,
                                          onchangeCallbackValue: val);
                                    });
                                    callback();
                                  },
                                  caseId: CaseId.logoCaseId,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    :

                    ///QR CODE
                    AppDefault.widgetIdCarrier == CaseId.qrCaseId
                        ? Column(
                            children: [
                              _roundWidget(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Background'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ColorsPop(
                                      caseId: CaseId.qrCaseId,
                                      onChanged: (a) {
                                        setState(() {
                                          Conditions.colorValue(
                                              caseId: CaseId.qrCaseId,
                                              onchangeCallbackValue: a,
                                              background: true,
                                              returnType: Conditions.onchange);
                                        });
                                        callback();
                                      },
                                      background: true,
                                      tooltip: 'QR Background Color',
                                    ),
                                  ],
                                ),
                              ),
                              _roundWidget(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Color & Size'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ColorsPop(
                                      caseId: CaseId.qrCaseId,
                                      onChanged: (a) {
                                        setState(() {
                                          Conditions.colorValue(
                                              caseId: CaseId.qrCaseId,
                                              onchangeCallbackValue: a,
                                              background: false,
                                              returnType: Conditions.onchange);
                                        });
                                        callback();
                                      },
                                      background: false,
                                      tooltip: 'QR  Color',
                                    ),
                                    RPSlider(
                                      sliderReturnType: RPSlider.size,
                                      onChanged: (val) {
                                        setState(() {
                                          Conditions.sizeSliderValue(
                                            caseId: CaseId.qrCaseId,
                                            onchangeCallbackValue: val,
                                            conditionReturnType:
                                                Conditions.onchange,
                                          );
                                        });
                                        callback();
                                      },
                                      caseId: CaseId.qrCaseId,
                                      min: 40,
                                      max: 90,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )

                        ///Labels 1-7
                        : AppDefault.widgetIdCarrier == CaseId.label1CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label2CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label3CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label4CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label5CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label6CaseId ||
                                AppDefault.widgetIdCarrier ==
                                    CaseId.label7CaseId
                            ? Column(
                                children: [
                                  ///Background
                                  _roundWidget(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text('Background'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: ColorsPop(
                                                caseId: CaseId.textAreaCaseId,
                                                onChanged: (color) {
                                                  setState(() {
                                                    Conditions.colorValue(
                                                        caseId: CaseId
                                                            .textAreaCaseId,
                                                        onchangeCallbackValue:
                                                            color,
                                                        background: false,
                                                        returnType: Conditions
                                                            .onchange);
                                                  });
                                                  callback();
                                                },
                                                background: true,
                                                tooltip: 'background Color',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///Color and Size
                                  _roundWidget(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Color & Size'),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ColorsPop(
                                          caseId: CaseId.labelTextCaseId,
                                          background: true,
                                          tooltip: 'label  Color',
                                          onChanged: (a) {
                                            setState(() {
                                              Conditions.colorValue(
                                                  caseId:
                                                      CaseId.labelTextCaseId,
                                                  onchangeCallbackValue: a,
                                                  returnType:
                                                      Conditions.onchange);
                                            });
                                            callback();
                                          },
                                        ),
                                        RPSlider(
                                          sliderReturnType: RPSlider.size,
                                          position: 'Label',
                                          onChanged: (val) {
                                            setState(() {
                                              Conditions.sizeSliderValue(
                                                  caseId:
                                                      CaseId.labelTextCaseId,
                                                  onchangeCallbackValue: val,
                                                  conditionReturnType:
                                                      Conditions.onchange);
                                            });
                                            callback();
                                          },
                                          caseId: CaseId.labelTextCaseId,
                                          min: 5,
                                          max: 25,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ColorsPop(
                                          caseId: CaseId.underLineWidthCaseId,
                                          background: true,
                                          tooltip: 'Underline Color',
                                          onChanged: (a) {
                                            setState(() {
                                              Conditions.colorValue(
                                                  caseId: CaseId
                                                      .underLineWidthCaseId,
                                                  onchangeCallbackValue: a,
                                                  background: true,
                                                  returnType:
                                                      Conditions.onchange);
                                            });
                                            callback();
                                          },
                                        ),
                                        Column(
                                          children: [
                                            RPSlider(
                                              sliderReturnType: RPSlider.size,
                                              position: 'Line height',
                                              onChanged: (val) {
                                                setState(() {
                                                  Conditions.sizeSliderValue(
                                                      caseId: CaseId
                                                          .underLineHeightCaseId,
                                                      onchangeCallbackValue:
                                                          val,
                                                      conditionReturnType:
                                                          Conditions.onchange);
                                                });
                                                callback();
                                              },
                                              caseId:
                                                  CaseId.underLineHeightCaseId,
                                              min: 0.1,
                                              max: 15,
                                            ),
                                            RPSlider(
                                              sliderReturnType: RPSlider.size,
                                              position: 'Line width',
                                              onChanged: (val) {
                                                setState(() {
                                                  Conditions.sizeSliderValue(
                                                      caseId: CaseId
                                                          .underLineWidthCaseId,
                                                      onchangeCallbackValue:
                                                          val,
                                                      conditionReturnType:
                                                          Conditions.onchange);
                                                });
                                                callback();
                                              },
                                              caseId:
                                                  CaseId.underLineWidthCaseId,
                                              min: 20,
                                              max: 170,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ColorsPop(
                                          caseId: CaseId.textCaseId,
                                          background: true,
                                          tooltip: 'Text  Color',
                                          onChanged: (a) {
                                            setState(() {
                                              Conditions.colorValue(
                                                  caseId: CaseId.textCaseId,
                                                  onchangeCallbackValue: a,
                                                  returnType:
                                                      Conditions.onchange);
                                            });
                                            callback();
                                          },
                                        ),
                                        RPSlider(
                                          sliderReturnType: RPSlider.size,
                                          position: 'Text',
                                          onChanged: (val) {
                                            setState(() {
                                              Conditions.sizeSliderValue(
                                                  caseId: CaseId.textCaseId,
                                                  onchangeCallbackValue: val,
                                                  conditionReturnType:
                                                      Conditions.onchange);
                                            });
                                            callback();
                                          },
                                          min: 5,
                                          max: 25,
                                          caseId: CaseId.textCaseId,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///Font Family
                                  _roundWidget(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Font Family'),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            ///The caseID's in below two buttons are working oppositely due to an issue in a code
                                            CardFonts(
                                              onChange: (a) {
                                                setState(() {
                                                  Conditions.cardFontsValues(
                                                      caseId: CaseId.textCaseId,
                                                      val: a);
                                                  callback();
                                                });
                                              },
                                            ),
                                            CardFonts(
                                              onChange: (a) {
                                                setState(() {
                                                  Conditions.cardFontsValues(
                                                      caseId: CaseId
                                                          .labelTextCaseId,
                                                      val: a);
                                                  callback();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///Radius
                                  _roundWidget(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Radius'),
                                        RPSlider(
                                          onChanged: (val) {
                                            setState(() {
                                              Conditions.radiusSliderValue(
                                                  caseId: AppDefault
                                                      .widgetIdCarrier,
                                                  position:
                                                      RadiusPosition.topLeft,
                                                  returnType:
                                                      Conditions.onchange,
                                                  onchangeCallbackValue: val);
                                            });
                                            callback();
                                          },
                                          sliderReturnType: RPSlider.radius,
                                          position: RadiusPosition.topLeft,
                                          caseId: AppDefault.widgetIdCarrier,
                                          max: 30,
                                          min: 0,
                                        ),
                                        RPSlider(
                                          onChanged: (val) {
                                            setState(() {
                                              Conditions.radiusSliderValue(
                                                  caseId: AppDefault
                                                      .widgetIdCarrier,
                                                  position:
                                                      RadiusPosition.topRight,
                                                  returnType:
                                                      Conditions.onchange,
                                                  onchangeCallbackValue: val);
                                            });
                                            callback();
                                          },
                                          sliderReturnType: RPSlider.radius,
                                          position: RadiusPosition.topRight,
                                          caseId: AppDefault.widgetIdCarrier,
                                          max: 30,
                                          min: 0,
                                        ),
                                        RPSlider(
                                          onChanged: (val) {
                                            setState(() {
                                              Conditions.radiusSliderValue(
                                                  caseId: AppDefault
                                                      .widgetIdCarrier,
                                                  position:
                                                      RadiusPosition.bottomLeft,
                                                  returnType:
                                                      Conditions.onchange,
                                                  onchangeCallbackValue: val);
                                            });
                                            callback();
                                          },
                                          sliderReturnType: RPSlider.radius,
                                          position: RadiusPosition.bottomLeft,
                                          caseId: AppDefault.widgetIdCarrier,
                                          max: 30,
                                          min: 0,
                                        ),
                                        RPSlider(
                                          onChanged: (val) {
                                            setState(() {
                                              Conditions.radiusSliderValue(
                                                  caseId: AppDefault
                                                      .widgetIdCarrier,
                                                  position: RadiusPosition
                                                      .bottomRight,
                                                  returnType:
                                                      Conditions.onchange,
                                                  onchangeCallbackValue: val);
                                            });
                                            callback();
                                          },
                                          sliderReturnType: RPSlider.radius,
                                          position: RadiusPosition.bottomRight,
                                          caseId: AppDefault.widgetIdCarrier,
                                          max: 30,
                                          min: 0,
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///Padding
                                  _roundWidget(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Padding'),
                                        RPSlider(
                                          sliderReturnType: RPSlider.padding,
                                          position: PaddingPosition.vertical,
                                          caseId: AppDefault.widgetIdCarrier,
                                          max: 30,
                                          min: 0,
                                          onChanged: (val) {
                                            setState(() {
                                              Conditions.paddingSliderValue(
                                                  caseId: AppDefault
                                                      .widgetIdCarrier,
                                                  returnType:
                                                      Conditions.onchange,
                                                  orientation:
                                                      PaddingPosition.vertical,
                                                  onchangeCallbackValue: val);
                                            });
                                            callback();
                                          },
                                        ),
                                        RPSlider(
                                          caseId: AppDefault.widgetIdCarrier,
                                          max: 30,
                                          min: 0,
                                          sliderReturnType: RPSlider.padding,
                                          position: PaddingPosition.horizontal,
                                          onChanged: (val) {
                                            setState(() {
                                              Conditions.paddingSliderValue(
                                                  caseId: AppDefault
                                                      .widgetIdCarrier,
                                                  returnType:
                                                      Conditions.onchange,
                                                  orientation: PaddingPosition
                                                      .horizontal,
                                                  onchangeCallbackValue: val);
                                            });
                                            callback();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                                  ///Text Box
                                  _roundWidget(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Change Box Style'),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ChangeTextBoxDesign(
                                          onChange: (a) {
                                            setState(() {
                                              Conditions.cardTextBoxDesign(
                                                  val: a);
                                              callback();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )

                            ///organization
                            : AppDefault.widgetIdCarrier == CaseId.organization
                                ? Column(
                                    children: [
                                      ///Background
                                      _roundWidget(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text('Background'),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: ColorsPop(
                                                    caseId: CaseId.organization,
                                                    onChanged: (color) {
                                                      setState(() {
                                                        Conditions.colorValue(
                                                            caseId: CaseId
                                                                .organization,
                                                            onchangeCallbackValue:
                                                                color,
                                                            background: true,
                                                            returnType:
                                                                Conditions
                                                                    .onchange);
                                                      });
                                                      callback();
                                                    },
                                                    background: true,
                                                    tooltip: 'background Color',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      ///Color and Size
                                      _roundWidget(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Color & Size'),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ColorsPop(
                                              caseId: CaseId.organization,
                                              background: false,
                                              tooltip: 'text  Color',
                                              onChanged: (a) {
                                                setState(() {
                                                  Conditions.colorValue(
                                                      caseId:
                                                          CaseId.organization,
                                                      onchangeCallbackValue: a,
                                                      background: false,
                                                      returnType:
                                                          Conditions.onchange);
                                                });
                                                callback();
                                              },
                                            ),
                                            Column(
                                              children: [
                                                RPSlider(
                                                  sliderReturnType:
                                                      RPSlider.size,
                                                  position: 'Text Size',
                                                  onChanged: (val) {
                                                    setState(() {
                                                      Conditions.sizeSliderValue(
                                                          caseId: CaseId
                                                              .organizationtextcolor,
                                                          onchangeCallbackValue:
                                                              val,
                                                          conditionReturnType:
                                                              Conditions
                                                                  .onchange);
                                                    });
                                                    callback();
                                                  },
                                                  caseId: CaseId
                                                      .organizationtextcolor,
                                                  min: 10,
                                                  max: 150,
                                                ),
                                                RPSlider(
                                                  sliderReturnType:
                                                      RPSlider.size,
                                                  position: 'Box Width',
                                                  onChanged: (val) {
                                                    setState(() {
                                                      Conditions.sizeSliderValue(
                                                          caseId: CaseId
                                                              .organization,
                                                          onchangeCallbackValue:
                                                              val,
                                                          conditionReturnType:
                                                              Conditions
                                                                  .onchange);
                                                    });
                                                    callback();
                                                  },
                                                  caseId: CaseId.organization,
                                                  min: 10,
                                                  max: 150,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),

                                      ///Font Family
                                      _roundWidget(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Font Family'),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                CardFonts(
                                                  onChange: (a) {
                                                    setState(() {
                                                      Conditions
                                                          .cardFontsValues(
                                                              caseId: CaseId
                                                                  .organization,
                                                              val: a);
                                                      callback();
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      ///Radius
                                      _roundWidget(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Radius'),
                                            RPSlider(
                                              onChanged: (val) {
                                                setState(() {
                                                  Conditions.radiusSliderValue(
                                                      caseId:
                                                          CaseId.organization,
                                                      position: RadiusPosition
                                                          .topLeft,
                                                      returnType:
                                                          Conditions.onchange,
                                                      onchangeCallbackValue:
                                                          val);
                                                });
                                                callback();
                                              },
                                              sliderReturnType: RPSlider.radius,
                                              position: RadiusPosition.topLeft,
                                              caseId: CaseId.organization,
                                              max: 30,
                                              min: 0,
                                            ),
                                            RPSlider(
                                              onChanged: (val) {
                                                setState(() {
                                                  Conditions.radiusSliderValue(
                                                      caseId:
                                                          CaseId.organization,
                                                      position: RadiusPosition
                                                          .topRight,
                                                      returnType:
                                                          Conditions.onchange,
                                                      onchangeCallbackValue:
                                                          val);
                                                });
                                                callback();
                                              },
                                              sliderReturnType: RPSlider.radius,
                                              position: RadiusPosition.topRight,
                                              caseId: CaseId.organization,
                                              max: 30,
                                              min: 0,
                                            ),
                                            RPSlider(
                                              onChanged: (val) {
                                                setState(() {
                                                  Conditions.radiusSliderValue(
                                                      caseId:
                                                          CaseId.organization,
                                                      position: RadiusPosition
                                                          .bottomLeft,
                                                      returnType:
                                                          Conditions.onchange,
                                                      onchangeCallbackValue:
                                                          val);
                                                });
                                                callback();
                                              },
                                              sliderReturnType: RPSlider.radius,
                                              position:
                                                  RadiusPosition.bottomLeft,
                                              caseId: CaseId.organization,
                                              max: 30,
                                              min: 0,
                                            ),
                                            RPSlider(
                                              onChanged: (val) {
                                                setState(() {
                                                  Conditions.radiusSliderValue(
                                                      caseId:
                                                          CaseId.organization,
                                                      position: RadiusPosition
                                                          .bottomRight,
                                                      returnType:
                                                          Conditions.onchange,
                                                      onchangeCallbackValue:
                                                          val);
                                                });
                                                callback();
                                              },
                                              sliderReturnType: RPSlider.radius,
                                              position:
                                                  RadiusPosition.bottomRight,
                                              caseId: CaseId.organization,
                                              max: 30,
                                              min: 0,
                                            ),
                                          ],
                                        ),
                                      ),

                                      ///Padding
                                      _roundWidget(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Padding'),
                                            RPSlider(
                                              sliderReturnType:
                                                  RPSlider.padding,
                                              position:
                                                  PaddingPosition.vertical,
                                              caseId: CaseId.organization,
                                              max: 30,
                                              min: 0,
                                              onChanged: (val) {
                                                setState(() {
                                                  Conditions.paddingSliderValue(
                                                      caseId:
                                                          CaseId.organization,
                                                      returnType:
                                                          Conditions.onchange,
                                                      orientation:
                                                          PaddingPosition
                                                              .vertical,
                                                      onchangeCallbackValue:
                                                          val);
                                                });
                                                callback();
                                              },
                                            ),
                                            RPSlider(
                                              caseId: CaseId.organization,
                                              max: 30,
                                              min: 0,
                                              sliderReturnType:
                                                  RPSlider.padding,
                                              position:
                                                  PaddingPosition.horizontal,
                                              onChanged: (val) {
                                                setState(() {
                                                  Conditions.paddingSliderValue(
                                                      caseId:
                                                          CaseId.organization,
                                                      returnType:
                                                          Conditions.onchange,
                                                      orientation:
                                                          PaddingPosition
                                                              .horizontal,
                                                      onchangeCallbackValue:
                                                          val);
                                                });
                                                callback();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )

                                ///Background Overlay
                                : AppDefault.widgetIdCarrier ==
                                        CaseId.backgroundTransparencyCaseId
                                    ? Container(height: _height/2.3,
                                      child: _roundWidget(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text('Background'),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: ColorsPop(
                                                      caseId: CaseId
                                                          .backgroundTransparencyCaseId,
                                                      background: true,
                                                      tooltip:
                                                          'Background overlay',
                                                      onChanged: (a) {
                                                        setState(() {
                                                          Conditions.colorValue(
                                                              caseId: CaseId
                                                                  .backgroundTransparencyCaseId,
                                                              onchangeCallbackValue:
                                                                  a,
                                                              background: true,
                                                              returnType:
                                                                  Conditions
                                                                      .onchange);
                                                        });
                                                        callback();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                    )

                                    ///Below _height/2.5  used for showing the text in the center of customizer widget
                                    : Container(
                                        height: _height / 2.5,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Select widget on Card',
                                          style: NeumorphicTheme.currentTheme(
                                                  context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ));
  }

 Widget _roundWidget({required Widget child,}) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      decoration: BoxDecoration(
          border: Border.all(
              color: NeumorphicTheme.currentTheme(context).borderColor),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          )),
      child: child,
    );
  }

  callback() {
    var callback = widget.onChange;
    if (callback != null) {
      var a = 1;
      callback(a);
    }
  }

}
