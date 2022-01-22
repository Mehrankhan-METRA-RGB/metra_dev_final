// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../../Contsants/Data.dart';
import 'conditions.dart';

class RPSlider extends StatefulWidget {
  static String padding = 'padding';
  static String radius = 'radius';
  static String size = 'size';

  final position;
  final ValueChanged<double>? onChanged;
  final String sliderReturnType;
  final double? min;
  final double? max;
  final String? caseId ;

  RPSlider(
      {this.caseId,
        this.onChanged,
      required this.sliderReturnType,
      this.position,
      this.max,
      this.min});

  @override
  _RPSliderState createState() => _RPSliderState();
}

class _RPSliderState extends State<RPSlider> {
  var _width, _height;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return widget.sliderReturnType == RPSlider.radius
        ? radiusController(
            caseId: widget.caseId,
            position: widget.position,
          )
        : widget.sliderReturnType == RPSlider.padding
            ? paddingController(
                caseId: widget.caseId,
                orientation: widget.position,
              )
            : widget.sliderReturnType == RPSlider.size
                ? sizeController(
                    caseId: widget.caseId,label:widget.position, max: widget.max, min: widget.min)
                : Text(
                    'The sliderReturnType value must be one of them RPSlider.padding , RPSlider.radius , RPSlider.size  ',
      style: TextStyle(color: Colors.red),);
  }

  Widget radiusController(
      {required  caseId,
      required String position,
      Color color = Colors.black87}) {
    return Container(
      // width: width - width * 0.740,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  position,
                  style: TextStyle(fontSize: 10, color: color),
                ),
                Spacer(),
                Text(
                  Conditions.radiusSliderValue(
                          caseId: caseId,
                          position: position,
                          returnType: Conditions.value)
                      .round()
                      .toString(),
                  style: TextStyle(fontSize: 10, color: color),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
           Slider(
             autofocus: true,
              min: 0.0,
              max: 30,
              value: Conditions.radiusSliderValue(
                  caseId: caseId, position: position, returnType: Conditions.value),
              onChanged: (sts) {
                final callBack = widget.onChanged;
                if (callBack != null) {
                  callBack(sts);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget paddingController(
      {required  caseId,
      String orientation = PaddingPosition.vertical,
      Color color = Colors.black87}) {
    return Container(
      // width: width - width * 0.740,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  orientation,
                  style: TextStyle(fontSize: 10, color: color),
                ),
                Spacer(),
                Text(
                  Conditions.paddingSliderValue(
                          caseId: caseId,
                          orientation: orientation,
                          returnType: Conditions.value)
                      .round()
                      .toString(),
                  style: TextStyle(fontSize: 10, color: color),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Slider(
              min: 0.0,
              max: 30,
              value: Conditions.paddingSliderValue(
                  caseId: caseId,
                  orientation: orientation,
                  returnType: Conditions.value),
              onChanged: (val) {
                final callBack = widget.onChanged;
                if (callBack != null) {
                  callBack(val);
                }

              },
            ),
          ],
        ),
      ),
    );
  }

  Widget sizeController(
      {required caseId,
        required label,
      subId = 'height',
      min = 0.0,
      max = 0.0,
      Color color = Colors.black87}) {
    return Container(
      // width: width - width * 0.740,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  label==null?'Size':label,
                  style: TextStyle(fontSize: 10, color: color),
                ),
                Spacer(),
                Text(
                  Conditions.sizeSliderValue(
                          caseId: caseId, conditionReturnType: Conditions.value,)
                      .round()
                      .toString(),
                  style: TextStyle(fontSize: 10, color: color),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Slider(
              min: min == 0.0 ? AppDefault.textMinimumSize.toDouble() : min.toDouble(),
              max: max == 0.0 ? AppDefault.textMaximumSize.toDouble() : max.toDouble(),
              value: Conditions.sizeSliderValue(
                  caseId: caseId, conditionReturnType: 'value',),
              onChanged: (val) {
                final callBack = widget.onChanged;
                if (callBack != null) {
                  callBack(val);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
