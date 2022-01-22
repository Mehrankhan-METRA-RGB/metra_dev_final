import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'Data.dart';

class Pin extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChange;
  final TextInputType keyboardType;
  final String? initialValue;
  final ToolbarOptions? toolbarOptions;
  Pin({
  required  this.controller,
    this.initialValue = '',
    this.toolbarOptions = const ToolbarOptions(
        copy: true, paste: true, selectAll: true, cut: true),
    this.onChange,
    this.keyboardType = TextInputType.text,
  });

  @override
  _PinState createState() => _PinState();
}

class _PinState extends State<Pin> {
  double letterSpacingVal = 32;
  bool isShow = false;
  void letterSpacing() {
    if (widget.controller.text.contains(' ')) {
      setState(() {
        isShow = true;
      });
    } else if (widget.controller.text.contains('-')) {
      setState(() {
        isShow = true;
      });
    } else if (widget.controller.text.contains('.')) {
      setState(() {
        isShow = true;
      });
    } else if (widget.controller.text.contains(',')) {
      setState(() {
        isShow = true;
      });
    } else if (widget.controller.text.split('1').length - 1 == 5) {
      setState(() {
        letterSpacingVal = 35;
      });
    } else if (widget.controller.text.split('1').length - 1 == 3) {
      setState(() {
        letterSpacingVal = 33.4;
      });
    } else if (widget.controller.text.split('1').length - 1 == 2) {
      setState(() {
        letterSpacingVal = 32;
      });
    } else if (widget.controller.text.split('0').length - 1 >= 3) {
      setState(() {
        letterSpacingVal = 31;
      });
    } else {
      setState(() {
        isShow = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    letterSpacing();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 0),
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _widget(leftRadius: 4),
                _widget(),
                _widget(),
                _widget(),
                _widget(rightRadius: 4),
              ],
            ),
            Container(
                width: 42 * 5,
                height: 65,
                // color: Colors.black26,
                child: TextFormField(
                    controller: widget.controller,
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.start,
                    maxLength: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your 5 Digits PIN';
                      } else if (value.length < 5) {
                        return 'PIN must be 5 Digits';
                      } else {
                        return null;
                      }
                    },
                    onChanged: widget.onChange!,
                    showCursor: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        letterSpacing: letterSpacingVal,
                        fontSize: 17,
                        fontFamily: AppFonts.almaraiBold))),
            isShow
                ? errorShow()
                : Container(
                    width: 0.1,
                    height: 0.1,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _widget(
      {double width = 42,
      double height = 45,
      double leftRadius = 0,
      double rightRadius = 0}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
            left: BorderSide(width: 1),
            right: BorderSide(width: 1)),
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(leftRadius),
            right: Radius.circular(rightRadius)),
      ),
    );
  }

  Widget errorShow(
      {bool? isShow,
      double width = 42 * 5,
      double height = 41,
      double leftRadius = 4,
      double rightRadius = 4}) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.8),
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(leftRadius),
            right: Radius.circular(rightRadius)),
      ),
      child: Row(
        children: [
          Text(
            'Only Decimal Numbers\n are allowed',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              widget.controller.clear();
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 17,
            ),
          )
        ],
      ),
    );
  }
}
