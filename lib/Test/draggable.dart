import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Console/Editor/Card.dart';
import '../Console/Editor/CardAssets/conditions.dart';


// class AppDraggable extends StatefulWidget {
//   AppDraggable({this.initialData,this.onTap,required this.isWidgetSelected,required this.stream, required this.child,required this.caseId});
//   final String caseId;
//   final  void Function()? onTap;
//   final bool isWidgetSelected;
//   final Stream<PositionCard> stream;
//   final PositionCard? initialData;
//   final Widget child;
//   @override
//   _AppDraggableState createState() => _AppDraggableState();
// }
//
// class _AppDraggableState extends State<AppDraggable> {
//   AppStream stream = AppStream();
//   // bool isWidgetSelected()=>AppDefault.widgetIdCarrier == widget.caseId?true:false;
//
//   @override
//   void dispose() {
//     // : implement dispose
//     super.dispose();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     double? _padding()=>widget.isWidgetSelected?5:5;
//     ///this will HighLight widget when selected
//     int   _borderHighLightColorValue() => widget.isWidgetSelected
//         ? 0xff4fff03
//         : 0x4fff03;
// // print(widget.isWidgetSelected);
//     return StreamBuilder<PositionCard>(
//         initialData:widget.initialData,
//         stream: widget.stream,
//         builder: (context, snapshot) {
//           // print(snapshot.hasData);
//           if (snapshot.hasData) {
//             return Positioned(
//               top:snapshot.data!.dy!,
//               left:snapshot.data!.dx!,
//               child: InkWell(
//                   mouseCursor: MouseCursor.uncontrolled,
//                   onTap: widget.onTap,
//                   child:  Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: DottedBorder(
//                           color: Color(_borderHighLightColorValue()),
//                           strokeWidth: 1,
//                           borderType:BorderType.RRect,
//                           strokeCap: StrokeCap.square,
//                           dashPattern:[1,2],
//                           padding: EdgeInsets.all(2.5),
//                           child:Container(
//                             // decoration: BoxDecoration(border:_borderHighLight()  ),
//                             width: 150 ,
//                             height: 50 ,
//                             child: widget.child,
//                           ), ),
//                       ),
//                       Positioned(top: 0,left: 0,
//
//                         child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color:Color(_borderHighLightColorValue()), ),
//                             child: Icon(Icons.drag_handle_rounded,size: 12,color:widget.isWidgetSelected?Colors.white:Colors.transparent.withOpacity(0.0) ,)),
//                       )
//
//                     ],
//                   )),
//             );
//           } else {
//             return Text('error',style: TextStyle(color: Colors.black45),);
//           }
//         });
//   }
// }


class AppDraggable extends StatefulWidget {
  final String caseId;
final void Function()? onTap;
final Offset offset;
final double? scale;
  final bool isWidgetSelected;
  final Widget? child;
  AppDraggable({required this.isWidgetSelected,this.scale=1,required this.offset,this.onTap,this.child,required this.caseId});
  @override State<StatefulWidget> createState() {
    return _AppDraggableState();
  }
}
class _AppDraggableState extends State<AppDraggable> {
  double? xPosition=0;
  double? yPosition=0;
  Color? color;
  @override
  void initState() {
    xPosition=widget.offset.dx;
    yPosition=widget.offset.dy;
    color = Colors.indigo;
    super.initState();
  }
  final _key = GlobalKey();
  @override
  Widget build(BuildContext context) {

    int   _borderHighLightColorValue() => widget.isWidgetSelected
        ? 0xff4fff03
        : 0x4fff03;
    return Positioned(
      key: _key,
      top: yPosition!,
      left: xPosition!,
      child: GestureDetector(
        onTap:widget.onTap,
        onPanUpdate: (tapInfo) {
          if(widget.isWidgetSelected)
          setState(() {

            ///create Vertical MOVEMENT boolean variable
            bool isVerticalNegative=tapInfo.delta.direction.isNegative;

            if(!isVerticalNegative){

              print('Downward:$yPosition');
              if((AppCard.cardHeight*widget.scale!)-_key.currentContext!.size!.height>yPosition!){
                yPosition =(yPosition!+ tapInfo.delta.dy);
                Conditions.verticalMovementValue(caseId: widget.caseId, onchangeCallbackValue: yPosition!);

              }


            }else{
              print('Upward:$yPosition');
              if(yPosition!>0){

                yPosition =(yPosition!+ tapInfo.delta.dy);
                Conditions.verticalMovementValue(caseId: widget.caseId, onchangeCallbackValue: yPosition!);
              }

            }
            ///create horizontal MOVEMENT boolean variable
            bool isHorizontalNegative=tapInfo.delta.dx.isNegative;
            if(!isHorizontalNegative){
              print('ToRight:$xPosition');
              if(AppCard.cardWidth*widget.scale!-_key.currentContext!.size!.width>xPosition!){
                xPosition =(xPosition!+ tapInfo.delta.dx);
                Conditions.horizontalMovementValue(caseId: widget.caseId, onchangeCallbackValue: xPosition!);
              }
            }else{
              print('ToLeft:$xPosition');
              if(xPosition!>0){
                xPosition =(xPosition!+ tapInfo.delta.dx);
                Conditions.horizontalMovementValue(caseId: widget.caseId, onchangeCallbackValue: xPosition!);
              }
            }


          });
        },
        child: Stack(
          children: [
            Padding(

              padding: const EdgeInsets.all(8.0),
              child: DottedBorder(
                color: Color(_borderHighLightColorValue()),
                strokeWidth: 1,
                borderType:BorderType.RRect,
                strokeCap: StrokeCap.square,
                dashPattern:[1,2],
                padding: EdgeInsets.all(2.5),
                child:widget.child!, ),
            ),
            Positioned(top: 0,left: 0,

              child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color:Color(_borderHighLightColorValue()), ),
                  child: Icon(Icons.drag_handle_rounded,size: 12,color:widget.isWidgetSelected?Colors.white:Colors.transparent.withOpacity(0.0) ,)),
            )

          ],
        ),
      ),
    );
  }
}