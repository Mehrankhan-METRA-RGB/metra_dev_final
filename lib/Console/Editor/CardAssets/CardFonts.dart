import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../Contsants/Data.dart';


class CardFonts extends StatefulWidget {
  final caseId;
  final ValueChanged? onChange;
  CardFonts({this.caseId,this.onChange});
  @override
  _CardFontsState createState() => _CardFontsState();
}

class _CardFontsState extends State<CardFonts> {
  Object _value=AppFonts.almaraiLight;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      menuMaxHeight: 400,
alignment: Alignment.bottomCenter,
isExpanded: true,
   iconSize: 15,
   elevation:16,
        icon: Icon(Icons.font_download),
        hint: Text('Select FontFamily'),

        value: _value,
        items:[
          DropdownMenuItem(
            child: Text("Almarai ExtraBold",style: TextStyle(fontFamily:AppFonts.almaraiExtraBold ),),
            value: AppFonts.almaraiExtraBold,
          ),
          DropdownMenuItem(
            child: Text("Almarai Bold",style: TextStyle(fontFamily:AppFonts.almaraiBold ),),
            value: AppFonts.almaraiBold,
          ),
          DropdownMenuItem(
            child: Text("Almarai Light",style: TextStyle(fontFamily:AppFonts.almaraiLight ),),
            value: AppFonts.almaraiLight,
          ),
          DropdownMenuItem(
            child: Text("AbrilFatface ",style: TextStyle(fontFamily:AppFonts.AbrilFatface ),),
            value: AppFonts.AbrilFatface,
          ),
          DropdownMenuItem(
            child: Text("Architects",style: TextStyle(fontFamily:AppFonts.Architects ),),
            value: AppFonts.Architects,
          ),

          DropdownMenuItem(
            child: Text("Almarai Regular",style: TextStyle(fontFamily:AppFonts.almaraiRegular ),),
            value: AppFonts.almaraiRegular,
          ),
          DropdownMenuItem(
            child: Text("Bangers",style: TextStyle(fontFamily:AppFonts.Bangers ),),
            value: AppFonts.Bangers,
          ),
          DropdownMenuItem(
            child: Text("BebasNeue",style: TextStyle(fontFamily:AppFonts.BebasNeue ),),
            value: AppFonts.BebasNeue,
          ),
          DropdownMenuItem(
            child: Text("Bungee Shade",style: TextStyle(fontFamily:AppFonts.BungeeShade ),),
            value: AppFonts.BungeeShade,
          ),
          DropdownMenuItem(
            child: Text("Cinzel Regular",style: TextStyle(fontFamily:AppFonts.CinzelRegular ),),
            value: AppFonts.CinzelRegular,
          ),

          DropdownMenuItem(
            child: Text("Cinzel Extra Bold",style: TextStyle(fontFamily:AppFonts.CinzelExtraBold ),),
            value: AppFonts.CinzelExtraBold,
          ),
          DropdownMenuItem(
            child: Text("Cinzel Bold",style: TextStyle(fontFamily:AppFonts.CinzelBold ),),
            value: AppFonts.CinzelBold,
          ),

          DropdownMenuItem(
            child: Text("Cinzel Medium",style: TextStyle(fontFamily:AppFonts.CinzelMedium ),),
            value: AppFonts.CinzelMedium,
          ),

          DropdownMenuItem(
            child: Text("Cinzel Semi Bold",style: TextStyle(fontFamily:AppFonts.CinzelSemiBold ),),
            value: AppFonts.CinzelSemiBold,
          ),

          DropdownMenuItem(
            child: Text("CinzelVariable",style: TextStyle(fontFamily:AppFonts.CinzelVariable ),),
            value: AppFonts.CinzelVariable,
          ),
          DropdownMenuItem(
            child: Text("Cinzel Decoration Black",style: TextStyle(fontFamily:AppFonts.CinzelDecorBlack ),),
            value: AppFonts.CinzelDecorBlack,
          ),
          DropdownMenuItem(
            child: Text("Cinzel Decoration Bold",style: TextStyle(fontFamily:AppFonts.CinzelDecorBold ),),
            value: AppFonts.CinzelDecorBold,
          ),
          DropdownMenuItem(
            child: Text("Cinzel Decoration Regular",style: TextStyle(fontFamily:AppFonts.CinzelDecorRegular ),),
            value: AppFonts.CinzelDecorRegular,
          ),
          DropdownMenuItem(
            child: Text("Comfortaa Regular",style: TextStyle(fontFamily:AppFonts.ComfortaaRegular ),),
            value: AppFonts.ComfortaaRegular,
          ),
          DropdownMenuItem(
            child: Text("Comfortaa Light",style: TextStyle(fontFamily:AppFonts.ComfortaaLight ),),
            value: AppFonts.ComfortaaLight,
          ),
          DropdownMenuItem(
            child: Text("Comfortaa Medium",style: TextStyle(fontFamily:AppFonts.ComfortaaMedium ),),
            value: AppFonts.ComfortaaMedium,
          ),
          DropdownMenuItem(
            child: Text("Comfortaa Semi Bold",style: TextStyle(fontFamily:AppFonts.ComfortaaSemiBold ),),
            value: AppFonts.ComfortaaSemiBold,
          ),
          DropdownMenuItem(
            child: Text("Comfortaa ",style: TextStyle(fontFamily:AppFonts.Comfortaa_wght ),),
            value: AppFonts.Comfortaa_wght,
          ),
          DropdownMenuItem(
            child: Text("Courgette Regular",style: TextStyle(fontFamily:AppFonts.CourgetteRegular ),),
            value: AppFonts.CourgetteRegular,
          ),
          DropdownMenuItem(
            child: Text("DancingScript Regular",style: TextStyle(fontFamily:AppFonts.DancingScriptRegular ),),
            value: AppFonts.DancingScriptRegular,
          ),
          DropdownMenuItem(
            child: Text("DancingScript SemiBold",style: TextStyle(fontFamily:AppFonts.DancingScriptSemiBold ),),
            value: AppFonts.DancingScriptSemiBold,
          ),
          DropdownMenuItem(
            child: Text("DancingScript Bold",style: TextStyle(fontFamily:AppFonts.DancingScriptBold ),),
            value: AppFonts.DancingScriptBold,
          ),
          DropdownMenuItem(
            child: Text("DancingScript variable",style: TextStyle(fontFamily:AppFonts.DancingScriptVariableFont_wght ),),
            value: AppFonts.DancingScriptVariableFont_wght,
          ),







        ],
        onChanged: (value) {
          var callback=widget.onChange;
          if(callback!=null){
            callback(value);
          }
          setState(() {_value=value!;});
        },

      );
  }

}
