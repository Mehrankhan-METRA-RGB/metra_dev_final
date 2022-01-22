import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../Contsants/Data.dart';

// ignore: must_be_immutable
class Movement extends StatefulWidget {
static final  vertical='vertical';
static final  horizontal='horizontal';

  final ValueChanged<double>? onChanged;
  final caseId;
  final showLabels;
   String? orientation=Movement.horizontal;
  Movement({required this.onChanged,required this.caseId, required this.orientation,this.showLabels=true});

  @override
  _MovementState createState() => _MovementState();
}

class _MovementState extends State<Movement> {
  @override
  Widget build(BuildContext context) {
    return movementController(orientation:widget.orientation,id: widget.caseId,showLabels: widget.showLabels);
  }
  Widget movementController({required orientation, required id,showLabels}) {
    return orientation == Movement.vertical
        ? SfSlider.vertical(
      // showDivisors:false,
      // show:false,
      min: 0.0,
      max: 100.0,
      value: AppDefault.defaultVertVal,
      interval: 10,
      showTicks: true,
      showLabels: showLabels,
      enableTooltip: true,
      stepSize: 0.5,

      minorTicksPerInterval: 2,
      tooltipPosition: SliderTooltipPosition.left,
      onChanged: (dynamic value) {
        setState(() => AppDefault.defaultVertVal=value);
        final callBack = widget.onChanged;
        if (callBack != null) {
          callBack(value);
        }
      },
    )
        : orientation == Movement.horizontal?
    SfSlider(

      min: 0.0,
      max: 100.0,
      value: AppDefault.defaultHorVal,
      interval: 10,
      showTicks: true,
      showLabels: showLabels,
      enableTooltip: true,
      stepSize: 0.5,

      minorTicksPerInterval: 2,
      onChanged: (dynamic value) {
        setState(() => AppDefault.defaultHorVal = value);
        final callBack = widget.onChanged;
        if (callBack != null) {
          callBack(value);
        }
  },):Text('Please Correct your Orientation Value i.e: MovementWidget.vertical  MovementWidget.horizontal'
    ,style: TextStyle(color: Colors.red),);
}















}
