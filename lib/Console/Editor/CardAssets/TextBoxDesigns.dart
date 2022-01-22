import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../Contsants/Data.dart';


class ChangeTextBoxDesign extends StatefulWidget {

  final ValueChanged? onChange;
  ChangeTextBoxDesign({this.onChange});
  @override
  _ChangeTextBoxDesignState createState() => _ChangeTextBoxDesignState();
}

class _ChangeTextBoxDesignState extends State<ChangeTextBoxDesign> {

  Object _defaultValue=TextBoxDesign.defaultValue;
  @override
  Widget build(BuildContext context) {

    return DropdownButton(
      underline:Container(),
      isExpanded: true,
      iconSize: 20,
      elevation:12,
      icon: Icon(Icons.design_services),
      hint: Text('Select Design'),
      // dropdownColor: Colors.teal,
      value: _defaultValue,
      items:[
        DropdownMenuItem(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Label",style: styleDropDown()),
              SizedBox(width:70,child: Divider(height: 1,color:Color(ColorValue.underLine),)),
              Text("Text Value",style: styleDropDown()),
            ],
          ),
          value: TextBoxStyle.allUpDown,
        ),
        DropdownMenuItem(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Label",style: styleDropDown()),

              Text("Text Value",style: styleDropDown()),
            ],
          ),
          value: TextBoxStyle.onlyUpDown,
        ),

        DropdownMenuItem(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Label: ",style: styleDropDown()),

              Text("Text Value",style: styleDropDown()),
            ],
          ),
          value:TextBoxStyle.allRightLeft,
        ),


        DropdownMenuItem(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Label ",style: styleDropDown()),

              Text("Text Value",style: styleDropDown()),
            ],
          ),
          value:TextBoxStyle.onlyRightLeft,
        ),
        DropdownMenuItem(
          child: Text("Text Value",style: styleDropDown()),
          value: TextBoxStyle.onlyValue,
        ),



      ],
      onChanged: (value) {
        var callback=widget.onChange;
        if(callback!=null){
          callback(value);
        }
        setState(() {_defaultValue=value!;});

      },

    );
  }





styleDropDown(){return TextStyle(fontFamily:AppFonts.almaraiRegular ,fontSize: 10,color: Colors.black54);}
}
