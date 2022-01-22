
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../Contsants/Data.dart';
import '../../../Models/Models.dart';


class CardText extends StatefulWidget {
  final String? cardTextBoxStyle;
  final String? label;
  final String? value;
  final String? caseId;
  final bool isEditable;
  final CardTextStyle? decoration;
  final double? sizeRatio;
  final ValueChanged? onChange;
  CardText({
    required this.caseId,
    this.decoration,
    this.isEditable = true,
    this.sizeRatio = 1,
    this.cardTextBoxStyle = TextBoxStyle.allUpDown,
    this.label = 'label',
    this.value = 'label value',
    this.onChange,
  });
  @override
  _CardTextState createState() => _CardTextState();
}

class _CardTextState extends State<CardText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: widget.cardTextBoxStyle == TextBoxStyle.onlyValue
          ?///only value
      value()
          : widget.cardTextBoxStyle == TextBoxStyle.allUpDown
              ?///All up down
      Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    label(),
                    Container(
                        width: underlineValues('width') * widget.sizeRatio!,
                        child: Divider(
                          height: underlineValues('height') * widget.sizeRatio!,
                          color: Color(underlineValues('color')),
                        )),
                    value()
                  ],
                )
              : widget.cardTextBoxStyle == TextBoxStyle.onlyUpDown
                  ? /// only up down
      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label(),
                        SizedBox(
                          height: 1 * widget.sizeRatio!,
                        ),
                        value()
                      ],
                    )
                  : widget.cardTextBoxStyle == TextBoxStyle.allRightLeft
                      ?///all right left

      rowText(divider: ':')
                      : widget.cardTextBoxStyle == TextBoxStyle.onlyRightLeft
                          ? ///only left right
      rowText(divider:' ')
                          :
      Container(alignment: Alignment.center,child: Text('Please select one of TextBoxStyle field',style: TextStyle(color: Colors.red),),),
    );
  }

  label({divider = ''}) {
    return Text(
      '${widget.label}$divider ',textAlign: TextAlign.center,textHeightBehavior: TextHeightBehavior(),
      style: TextStyle(
          color: Color(labelValues('color')),
          fontFamily: labelValues('fonts'),
          fontSize: labelValues('size') * widget.sizeRatio!),
    );
  }

  value() {
    return Text(
      '${widget.value}',
      style: TextStyle(
          color: Color(textValues('color')),
          fontFamily: textValues('fonts'),
          fontSize: textValues('size') * widget.sizeRatio!),
    );
  }
rowText({divider = ''}){return RichText(text: TextSpan(text: '${widget.label}$divider ',style:
TextStyle(
    color: Color(labelValues('color')),
    fontFamily: labelValues('fonts'),
    fontSize: labelValues('size') * widget.sizeRatio!),children: [TextSpan(text:widget.value,style:TextStyle(
    color: Color(textValues('color')),
    fontFamily: textValues('fonts'),
    fontSize: textValues('size') * widget.sizeRatio!), )] ),);}
  labelValues(type) {
    bool edit = widget.isEditable;
    CardTextStyle? decor = widget.decoration;
    var callBack = widget.onChange;
    if (callBack != null) {
      callBack(type);
    }
    switch (type) {
      case 'fonts':

        ///check if card is in editable mode or not
      ///editable mode will access static variables else non editable mode will access CardModel values
        if (edit) {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return FontsValue.lab1;
            case CaseId.label2CaseId:
              return FontsValue.lab2;
            case CaseId.label3CaseId:
              return FontsValue.lab3;
            case CaseId.label4CaseId:
              return FontsValue.lab4;
            case CaseId.label5CaseId:
              return FontsValue.lab5;
            case CaseId.label6CaseId:
              return FontsValue.lab6;
            case CaseId.label7CaseId:
              return FontsValue.lab7;
          }
        } else {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return decor!.labelFontFamily;
            case CaseId.label2CaseId:
              return decor!.labelFontFamily;
            case CaseId.label3CaseId:
              return decor!.labelFontFamily;
            case CaseId.label4CaseId:
              return decor!.labelFontFamily;
            case CaseId.label5CaseId:
              return decor!.labelFontFamily;
            case CaseId.label6CaseId:
              return decor!.labelFontFamily;
            case CaseId.label7CaseId:
              return decor!.labelFontFamily;
          }
        }

        break;
      case 'color':

        ///check if card is in editable mode or not
        if (edit) {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return ColorValue.lab1;
            case CaseId.label2CaseId:
              return ColorValue.lab2;
            case CaseId.label3CaseId:
              return ColorValue.lab3;
            case CaseId.label4CaseId:
              return ColorValue.lab4;
            case CaseId.label5CaseId:
              return ColorValue.lab5;
            case CaseId.label6CaseId:
              return ColorValue.lab6;
            case CaseId.label7CaseId:
              return ColorValue.lab7;
          }
        } else {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return decor!.labelColor;
            case CaseId.label2CaseId:
              return decor!.labelColor;
            case CaseId.label3CaseId:
              return decor!.labelColor;
            case CaseId.label4CaseId:
              return decor!.labelColor;
            case CaseId.label5CaseId:
              return decor!.labelColor;
            case CaseId.label6CaseId:
              return decor!.labelColor;
            case CaseId.label7CaseId:
              return decor!.labelColor;
          }
        }

        break;
      case 'size':
        if (edit) {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return SizeValue.lab1;
            case CaseId.label2CaseId:
              return SizeValue.lab2;
            case CaseId.label3CaseId:
              return SizeValue.lab3;
            case CaseId.label4CaseId:
              return SizeValue.lab4;
            case CaseId.label5CaseId:
              return SizeValue.lab5;
            case CaseId.label6CaseId:
              return SizeValue.lab6;
            case CaseId.label7CaseId:
              return SizeValue.lab7;
          }
        } else {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return decor!.labelSize;
            case CaseId.label2CaseId:
              return decor!.labelSize;
            case CaseId.label3CaseId:
              return decor!.labelSize;
            case CaseId.label4CaseId:
              return decor!.labelSize;
            case CaseId.label5CaseId:
              return decor!.labelSize;
            case CaseId.label6CaseId:
              return decor!.labelSize;
            case CaseId.label7CaseId:
              return decor!.labelSize;
          }
        }

        break;
    }
  }

  textValues(type) {
    bool edit = widget.isEditable;
    CardTextStyle? decor = widget.decoration;
    var callBack = widget.onChange;
    if (callBack != null) {
      callBack(type);
    }
    switch (type) {
      case 'fonts':
        if (edit) {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return FontsValue.txt1;
            case CaseId.label2CaseId:
              return FontsValue.txt2;
            case CaseId.label3CaseId:
              return FontsValue.txt3;
            case CaseId.label4CaseId:
              return FontsValue.txt4;
            case CaseId.label5CaseId:
              return FontsValue.txt5;
            case CaseId.label6CaseId:
              return FontsValue.txt6;
            case CaseId.label7CaseId:
              return FontsValue.txt7;
          }
        } else {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return decor!.valueFontFamily;
            case CaseId.label2CaseId:
              return decor!.valueFontFamily;
            case CaseId.label3CaseId:
              return decor!.valueFontFamily;
            case CaseId.label4CaseId:
              return decor!.valueFontFamily;
            case CaseId.label5CaseId:
              return decor!.valueFontFamily;
            case CaseId.label6CaseId:
              return decor!.valueFontFamily;
            case CaseId.label7CaseId:
              return decor!.valueFontFamily;
          }
        }

        break;
      case 'color':
        if (edit) {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return ColorValue.txt1;
            case CaseId.label2CaseId:
              return ColorValue.txt2;
            case CaseId.label3CaseId:
              return ColorValue.txt3;
            case CaseId.label4CaseId:
              return ColorValue.txt4;
            case CaseId.label5CaseId:
              return ColorValue.txt5;
            case CaseId.label6CaseId:
              return ColorValue.txt6;
            case CaseId.label7CaseId:
              return ColorValue.txt7;
          }
        } else {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return decor!.valueColor;
            case CaseId.label2CaseId:
              return decor!.valueColor;
            case CaseId.label3CaseId:
              return decor!.valueColor;
            case CaseId.label4CaseId:
              return decor!.valueColor;
            case CaseId.label5CaseId:
              return decor!.valueColor;
            case CaseId.label6CaseId:
              return decor!.valueColor;
            case CaseId.label7CaseId:
              return decor!.valueColor;
          }
        }

        break;
      case 'size':
        if (edit) {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return SizeValue.txt1;
            case CaseId.label2CaseId:
              return SizeValue.txt2;
            case CaseId.label3CaseId:
              return SizeValue.txt3;
            case CaseId.label4CaseId:
              return SizeValue.txt4;
            case CaseId.label5CaseId:
              return SizeValue.txt5;
            case CaseId.label6CaseId:
              return SizeValue.txt6;
            case CaseId.label7CaseId:
              return SizeValue.txt7;
          }
        } else {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return decor!.valueSize;
            case CaseId.label2CaseId:
              return decor!.valueSize;
            case CaseId.label3CaseId:
              return decor!.valueSize;
            case CaseId.label4CaseId:
              return decor!.valueSize;
            case CaseId.label5CaseId:
              return decor!.valueSize;
            case CaseId.label6CaseId:
              return decor!.valueSize;
            case CaseId.label7CaseId:
              return decor!.valueSize;
          }
        }

        break;
    }
  }

  underlineValues(type) {
    ///type:height , width , color
    bool edit = widget.isEditable;
    CardTextStyle? decor = widget.decoration;
    var callBack = widget.onChange;

    if (callBack != null) {
      callBack(type);
    }

    switch (type) {
      case 'height':
        if (edit) {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return SizeValue.underlineHeight1;
            case CaseId.label2CaseId:
              return SizeValue.underlineHeight2;
            case CaseId.label3CaseId:
              return SizeValue.underlineHeight3;
            case CaseId.label4CaseId:
              return SizeValue.underlineHeight4;
            case CaseId.label5CaseId:
              return SizeValue.underlineHeight5;
            case CaseId.label6CaseId:
              return SizeValue.underlineHeight6;
            case CaseId.label7CaseId:
              return SizeValue.underlineHeight7;
          }
        } else {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return decor!.underlineHeight;
            case CaseId.label2CaseId:
              return decor!.underlineHeight;
            case CaseId.label3CaseId:
              return decor!.underlineHeight;
            case CaseId.label4CaseId:
              return decor!.underlineHeight;
            case CaseId.label5CaseId:
              return decor!.underlineHeight;
            case CaseId.label6CaseId:
              return decor!.underlineHeight;
            case CaseId.label7CaseId:
              return decor!.underlineHeight;
          }
        }

        break;
      case 'color':
        if (edit) {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return ColorValue.underline1;
            case CaseId.label2CaseId:
              return ColorValue.underline2;
            case CaseId.label3CaseId:
              return ColorValue.underline3;
            case CaseId.label4CaseId:
              return ColorValue.underline4;
            case CaseId.label5CaseId:
              return ColorValue.underline5;
            case CaseId.label6CaseId:
              return ColorValue.underline6;
            case CaseId.label7CaseId:
              return ColorValue.underline7;
          }
        } else {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return decor!.underlineColor;
            case CaseId.label2CaseId:
              return decor!.underlineColor;
            case CaseId.label3CaseId:
              return decor!.underlineColor;
            case CaseId.label4CaseId:
              return decor!.underlineColor;
            case CaseId.label5CaseId:
              return decor!.underlineColor;
            case CaseId.label6CaseId:
              return decor!.underlineColor;
            case CaseId.label7CaseId:
              return decor!.underlineColor;
          }
        }

        break;
      case 'width':
        if (edit) {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return SizeValue.underlineWidth1;
            case CaseId.label2CaseId:
              return SizeValue.underlineWidth2;
            case CaseId.label3CaseId:
              return SizeValue.underlineWidth3;
            case CaseId.label4CaseId:
              return SizeValue.underlineWidth4;
            case CaseId.label5CaseId:
              return SizeValue.underlineWidth5;
            case CaseId.label6CaseId:
              return SizeValue.underlineWidth6;
            case CaseId.label7CaseId:
              return SizeValue.underlineWidth7;
          }
        } else {
          switch (widget.caseId) {
            case CaseId.label1CaseId:
              return decor!.underlineWidth;
            case CaseId.label2CaseId:
              return decor!.underlineWidth;
            case CaseId.label3CaseId:
              return decor!.underlineWidth;
            case CaseId.label4CaseId:
              return decor!.underlineWidth;
            case CaseId.label5CaseId:
              return decor!.underlineWidth;
            case CaseId.label6CaseId:
              return decor!.underlineWidth;
            case CaseId.label7CaseId:
              return decor!.underlineWidth;
          }
        }

        break;
    }
  }
}
