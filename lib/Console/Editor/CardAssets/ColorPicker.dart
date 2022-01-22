import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../Contsants/Data.dart';
import 'conditions.dart';

class ColorsPop extends StatefulWidget {
  final caseId;
  final bool background;
  final tooltip;
  final ValueChanged<int>? onChanged;
  final ValueChanged<int>? recentOnChanged;

  ColorsPop({
    required this.caseId,
    required this.onChanged,
    this.recentOnChanged,
    this.background = false,
    this.tooltip,
  });
  @override
  _ColorsPopState createState() => _ColorsPopState();
}

class _ColorsPopState extends State<ColorsPop> {
  @override
  Widget build(BuildContext context) {
    return colorController(
        caseId: widget.caseId,
        tooltip: widget.tooltip,
        background: widget.background);
  }

  Widget colorController({
    tooltip = 'color',
    bool background = false,
    required caseId,
  }) {
    return NeumorphicButton(
      padding: EdgeInsets.all(5.0),
      tooltip: 'Background Select',
      onPressed: () {
        setState(() {
          void changeColor(Color color) {
            final callBack = widget.onChanged;
            if (callBack != null) {
              callBack(color.value);
            }

            AppDefault.pickerColor = color.value;
          }

          showDialog(
            builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                child: ColorPicker(
                  enableAlpha: true,
                  displayThumbColor: true,
                  pickerColor: Color(Conditions.colorValue(
                      caseId: caseId,
                      background: background,
                      returnType: Conditions.value)),
                  onColorChanged: changeColor,
                  showLabel: true,
                  pickerAreaHeightPercent: 0.5,
                ),

//  Use Material color picker:
// child: MaterialPicker(
//   pickerColor: pickerColor,
//   onColorChanged: changeColor,
//   enableLabel: true,
//
//   //showLabel: false, // only on portrait mode
// ),

// Use Block color picker:
// child: BlockPicker(
//   pickerColor: currentColor,
//   onColorChanged: changeColor,
// ),

// child: MultipleChoiceBlockPicker(
//   pickerColors: currentColors,
//   onColorsChanged: changeColors,
// ),
              ),
              actions: <Widget>[
                Text('Recents'),

                Container(
                  width: 400,
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ColorValue.colorList.length,
                      itemBuilder: (context, position) {
                        return GestureDetector(
                          onTap: () {
                            Conditions.recentColorPosition = position;

                            final callBack = widget.onChanged;
                            if (callBack != null) {
                              ///This will pass color from a list as an argument into Conditions.colorValue();
                              callBack(ColorValue
                                  .colorList[Conditions.recentColorPosition]);
                            }
                          },
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 7.5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      "assets/images/transBack.png",
                                      height: 30,
                                      width: 30,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(
                                            ColorValue.colorList[position]),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
// ignore: deprecated_member_use
                RaisedButton(
                  child: const Text('Done'),
                  onPressed: () {
                    setState(() {
                      AppDefault.currentColor = Color(AppDefault.pickerColor);
                      recentColor(insertColor: AppDefault.pickerColor);
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            context: context,
          );
        });
      },
      style: NeumorphicStyle(
        color: Color(Conditions.colorValue(
          caseId: caseId,
          background: background,
          returnType: Conditions.value,
        ),),
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: NeumorphicIcon(
        Icons.color_lens,
        size: 15,
      ),
    );
  }

  recentColor({required var insertColor}) {
    setState(() {
      if (!ColorValue.colorList.contains(insertColor)) {
        if (ColorValue.colorList.length > 8) {
          ColorValue.colorList.removeLast();
          ColorValue.colorList.insert(0, insertColor);
        } else if (ColorValue.colorList.length <= 8) {
          ColorValue.colorList.insert(0, insertColor);
        }
      }
    });
  }
}
