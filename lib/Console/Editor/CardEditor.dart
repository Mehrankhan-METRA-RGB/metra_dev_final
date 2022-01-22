

import 'package:flip_card/flip_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../Contsants/Data.dart';
import '../../Contsants/app.dart';
import '../../Models/Models.dart';
import '../CardDesigns.dart';
import 'Card.dart';
import 'CardAssets/Customizer.dart';
import 'CardAssets/Movement.dart';
import 'CardAssets/conditions.dart';
import 'CardMethods.dart';


class CardEditor extends StatefulWidget {
  final CardCredentials? user;
  final CardModel? decoration;
  CardEditor({this.decoration,this.user});
  @override
  _CardEditorState createState() => _CardEditorState();
}

class _CardEditorState extends State<CardEditor> {
  var  sliderSize = 63;
  @override
  void initState() {
    
    //  implement initState
    super.initState();
    if(widget.decoration!=null){
      setState(() {
        ///This will show card design according to decoration value
        ///this method change card all static decoration values
        Methods.instance.cardCurrentDecoration(widget.decoration);
      });
    }

  }

  var _width, _height;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(

        body: SafeArea(
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: 10,
              boxShape: NeumorphicBoxShape.rect(),
              shadowDarkColor: Colors.black54,
              // shadowDarkColorEmboss: Colors.black87,
              shape: NeumorphicShape.concave,
              color: NeumorphicTheme.currentTheme(context).baseColor,
            ),
            child: Column(
              children: [
                ///Card Area
                Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.center, child: _editableCard(_width>=500?1.5:1)),
                ),
                Neumorphic(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  style: NeumorphicStyle(
                    depth: 0,
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      App.button(toolTip:'Background Select' ,onPressed: (){}, icon: Icons.image_rounded,),
                      Spacer(),
                      App.button(toolTip: 'Flip Card',onPressed: (){flipCardKey.currentState!.toggleCard();}, icon: Icons.flip,),
                      Spacer(),
                    ],
                  ),
                ),

                ///Customizer
                Expanded(
                  flex: 1,
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            depth: -4,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(15))),
                            shape: NeumorphicShape.concave,

                            shadowDarkColorEmboss: Colors.black87,

                          ),
                          child: SingleChildScrollView(padding: EdgeInsets.only(bottom: 60),
                            child: Customizer(
                              onChange: (a) {setState((){});},

                            ),
                          ),
                        ),
                      ),

                      ///right button bar
                      Container(
                        child: SizedBox(
                          width: 60,
                          child: Column(
                            children: [
                              Spacer(),
                              App.button(toolTip: 'Background Styles',onPressed: ()=>_cardBackgrounds(), icon: Icons.layers_rounded,),
                              Spacer(),
                              App.button(toolTip: 'Layouts',onPressed: (){}, icon: Icons.style,),
                              Spacer(),
                              App.button(toolTip: 'Saved Cards',onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){return CardDesigns(); })); }, icon: Icons.storage_outlined,),
                              Spacer(),
                              App.button(toolTip: 'Save',onPressed: () =>Methods.instance.saveCard(context), icon: Icons.save,),
                              Spacer(),
                              App.button(toolTip: 'Close',onPressed: ()=>Navigator.pop(context), icon: Icons.close_sharp,),
                              Spacer(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _editableCard(double _sizeW) {
    return  SingleChildScrollView(scrollDirection: Axis.horizontal,
      child: Container(
          alignment: Alignment.center,
          width: (AppCard.cardWidth * _sizeW) + sliderSize + 1,
          height: (AppCard.cardHeight * _sizeW) + sliderSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  FlipCard(
                      key: flipCardKey,
                      flipOnTouch: false,
                      front: Neumorphic(
                          style: NeumorphicStyle(boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(AppCard.radiusMedium*_sizeW)),
                              depth: 6,
                              shadowDarkColorEmboss: Colors.black87),
                          child:

                          AppCard(isEditable: true,sizeRatio: _sizeW,activeSide: AppCard.front,onChange:(a)=>setState(() {}), )
                      ),
                      back: Neumorphic(
                          style: NeumorphicStyle(
                              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(AppCard.radiusMedium*_sizeW)),
                              depth: 6,
                              shadowDarkColorEmboss: Colors.black87),
                          child:
                          AppCard(isEditable: true,sizeRatio: _sizeW,activeSide: AppCard.back,onChange:(a)=>setState(() {}), )

                      )),


                  ///Movement vertical button
                  Container(
                    height: AppCard.cardHeight * _sizeW,
                    child: Movement(
                      showLabels: false,
                      caseId: AppDefault.widgetIdCarrier,
                      orientation: Movement.vertical,
                      onChanged: (val) {
                        setState(() {
                          Conditions.verticalMovementValue(
                              caseId: AppDefault.widgetIdCarrier,
                              onchangeCallbackValue: val);
                        });
                      },
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  ///Movement horizontal button
                  Container(
                    width: AppCard.cardWidth * _sizeW,
                    child: Movement(
                      showLabels: false,
                      caseId: AppDefault.widgetIdCarrier,
                      orientation: Movement.horizontal,
                      onChanged: (val) {
                        setState(() {
                          Conditions.horizontalMovementValue(
                              caseId: AppDefault.widgetIdCarrier,
                              onchangeCallbackValue: val);
                        });
                      },
                    ),
                  ),
                  Spacer()
                ],
              ),
              Spacer(),
            ],
          )),
    );
  }

  _cardBackgrounds() {
    return App.alertBox(
      context,
      title: 'Card Background ',
      widget: Container(
        width: _width > 500 ? 500 : _width - 10,
        height: _height,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 180),
            itemCount: 36,
            itemBuilder: (context, position) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    AppDefault.defaultPositionBackgrndImage = position;
                  });
                  // callback();
                },
                child: Neumorphic(
                  margin: EdgeInsets.all(5),
                  style: NeumorphicStyle(
                    depth: 3,
                  ),
                  child: Image.asset(
                    'assets/images/bg_$position.jpg',
                  ),
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        MaterialButton(
          color: NeumorphicTheme.currentTheme(context).accentColor,
          child: Text(
            'Done',
            style: NeumorphicTheme.currentTheme(context).textTheme.button,
          ),
          onPressed: () {
            // callback();
            Navigator.of(context).pop();
          },
        ),
      ],
      scrollable: true,
    );

  }




}
