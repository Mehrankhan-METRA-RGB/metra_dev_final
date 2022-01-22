
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../Contsants/Data.dart';
import '../../Contsants/GlobalFunctions.dart';
import '../../Databases/Boxes/Boxes.dart';
import '../../Models/Models.dart';
import 'CardAssets/CardText.dart';

class AppCard extends StatefulWidget {
  static const cardHeight=168.0;
  static const cardWidth=272.0;
  static const radiusMedium=10.8850;
  static const radiusMax=11.338526;
  static const front='front';
  static const back='back';
  static  String orgName='METRA-IT';
  static  String label1='Name';
  static  String label2='Role';
  static  String label3='ID';
  static  String label4='Phone No';
  static  String label5='Gender';
  static  String label6='Postal Code';
  static  String label7='Address';
  static  String text1='Mehran Ullah Khan';
  static  String text2='Data Scientist';
  static  String text3='16102966*****';
  static  String text4='+923219195952';
  static  String text5='Male';
  static  String text6='23120';
  static  String text7='Pk/kpk/Mardan/Hathian/Jharai';
  static  String profileUrl='back';
  static  String logoUrl='back';
  static  String qrCode='App created by Mehran';

  final double sizeRatio;
  final bool isEditable;
  final activeSide;
  final CardCredentials? userData;
  final CardModel? decoration;

  final ValueChanged<dynamic>? onChange;
  AppCard({required this.isEditable,this.sizeRatio=1,this.activeSide=AppCard.front,this.decoration,this.userData,this.onChange});
  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {

  CardModel? _decor;
  CardCredentials? _userCredentials;
  ///BackGround Image function
  Widget backGroundImageMETRA({double size = 1, int? position = 1}) {
    return Image.asset(
      "assets/images/bg_$position.jpg",
      fit: BoxFit.cover,
      height: AppDefault.cardHeightSize * size,
      width: AppDefault.cardWidthSize * size,
    );
  }

  @override
  void initState() {
    // implement initState
    super.initState();
    _decor=widget.decoration;
    _userCredentials= widget.userData;
    haveUserCredentials =_userCredentials!=null?true:false;
  }
  bool haveUserCredentials=false;
  @override
  Widget build(BuildContext context) {
    return cardMETRA(cardHeight: AppCard.cardHeight,cardWidth: AppCard.cardWidth,
        isEditable: widget.isEditable,size: widget.sizeRatio);
  }



  Widget  cardMETRA({cardHeight, cardWidth ,
    double size = 1,required bool isEditable,})
  {
    ///Declare and Assign value
    Widget _editableCard()=>Container(
      child:  widget.activeSide==AppCard.front?
      Neumorphic(
        child:
        Container(
          height: cardHeight * size,
          width: cardWidth * size,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(
                AppCard.radiusMedium * size),
          ),

          child: Container(
            height: cardHeight * size,
            width: cardWidth * size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppCard.radiusMedium * size),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppCard.radiusMedium * size),
              child: Stack(
                children: [
                  ///Backgroud Water Mark
                  backGroundImageMETRA(size: size,position: AppDefault.defaultPositionBackgrndImage),
                  ///Backgroud Transperancy
                  GestureDetector(
                    onTap: () =>onClickListener(CaseId.backgroundTransparencyCaseId),
                    child: Container(
                      width: cardWidth*size,height: cardHeight*size,
                      decoration: BoxDecoration(borderRadius:BorderRadius.circular(AppCard.radiusMedium*size),
                        color: Color(ColorValue.backgroundTransparency),),

                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(3.0 * size),
                    child: Stack(
                      children: <Widget>[
                        ///organization name
                        Positioned(
                          bottom: Dy.organization * size,
                          left: Dx.organization * size,
                          child: GestureDetector(
                            onTap: ()=>onClickListener(CaseId.organization),
                            child: orgName(isEditable: true,size: size,),
                          ),
                        ),
                        ///Logo
                        Positioned(
                          bottom: Dy.logo * size,
                          left: Dx.logo * size,
                          child: GestureDetector(
                              onTap: ()=>onClickListener(CaseId.logoCaseId),
                              child: logoCard(size: size,isEditable: true)),
                        ),
                        ///Text Area
                        Positioned(
                          left: Dx.label1 * size,
                          bottom: Dy.label1 * size,
                          child: GestureDetector(onTap: ()=>onClickListener(CaseId.label1CaseId),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: PaddingValue.label1Vertical,horizontal: PaddingValue.label1Horizontal),
                              decoration:BoxDecoration(    color:Color(ColorValue.text1Background),

                                  borderRadius: BorderRadius.only(topRight: Radius.circular(RadiusValue.label1TopRight*size),topLeft:  Radius.circular(RadiusValue.label1TopLeft*size),bottomRight:  Radius.circular(RadiusValue.label1BottomRight*size),bottomLeft:  Radius.circular(RadiusValue.label1BottomLeft*size))),


                              child:
                              CardText(
                                sizeRatio: widget.sizeRatio,
                                caseId: CaseId.label1CaseId,
                                cardTextBoxStyle:TextBoxDesign.lv1,
                                label: 'Id',value: '09786543',

                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: Dx.label2 * size,
                          bottom: Dy.label2 * size,
                          child: GestureDetector(onTap: ()=>onClickListener(CaseId.label2CaseId),
                            child: Container( padding: EdgeInsets.symmetric(vertical: PaddingValue.label2Vertical,horizontal: PaddingValue.label2Horizontal),
                              decoration:BoxDecoration(    color:Color(ColorValue.text2Background),

                                  borderRadius: BorderRadius.only(topRight: Radius.circular(RadiusValue.label2TopRight*size),topLeft:  Radius.circular(RadiusValue.label2TopLeft*size),bottomRight:  Radius.circular(RadiusValue.label2BottomRight*size),bottomLeft:  Radius.circular(RadiusValue.label2BottomLeft*size))),


                              child:
                              CardText(
                                sizeRatio: widget.sizeRatio,
                                caseId: CaseId.label2CaseId,
                                cardTextBoxStyle:TextBoxDesign.lv2,
                                label: 'Name',value: 'Mehran ullah',

                              ),

                            ),
                          ),
                        ),
                        Positioned(
                          left: Dx.label3 * size,
                          bottom: Dy.label3 * size,
                          child: GestureDetector(onTap: ()=>onClickListener(CaseId.label3CaseId),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: PaddingValue.label3Vertical,horizontal: PaddingValue.label3Horizontal),
                              decoration:BoxDecoration(    color:Color(ColorValue.text3Background),

                                  borderRadius: BorderRadius.only(topRight: Radius.circular(RadiusValue.label3TopRight*size),topLeft:  Radius.circular(RadiusValue.label3TopLeft*size),bottomRight:  Radius.circular(RadiusValue.label3BottomRight*size),bottomLeft:  Radius.circular(RadiusValue.label3BottomLeft*size))),

                              child:
                              CardText(
                                sizeRatio: widget.sizeRatio,
                                caseId: CaseId.label3CaseId,
                                cardTextBoxStyle:TextBoxDesign.lv3,
                                label: 'Role',value: 'Soft-Engineer',


                              ),

                            ),
                          ),
                        ),
                        ///Profile Image
                        Positioned(
                          left: Dx.profile * size,
                          bottom: Dy.profile * size,
                          child: GestureDetector(
                              onTap: ()=>onClickListener(CaseId.profileCaseId),
                              child: profileCard(size: size,isEditable: true)),
                        ),
                        ///QR Code Image
                        Positioned(
                            left: Dx.qr * size,
                            bottom: Dy.qr * size,
                            child: GestureDetector(
                                onTap: ()=>onClickListener(CaseId.qrCaseId),
                                child: qrCodeCard(size: size,isEditable: true))),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
        style: NeumorphicStyle(
          depth: 8,
          shadowDarkColor: AppDefault.backgroundApp,
          boxShape:
          NeumorphicBoxShape.roundRect(
            BorderRadius.circular(
                AppCard.radiusMedium * size),
          ),
        ),
      )

      ///EDITABLE CARD  BACK
          :
      Neumorphic(
        child: Container(
            height: cardHeight * size,
            width: cardWidth * size,
            decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(
                  AppCard.radiusMedium * size),
            ),
            child:

            Container(
              height: cardHeight * size,
              width: cardWidth * size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppCard.radiusMedium * size),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppCard.radiusMedium * size),
                child: Stack(
                  children: [
                    ///Backgroud Water Mark
                    backGroundImageMETRA(size: size,position: AppDefault.defaultPositionBackgrndImage),
                    ///Backgroud Transperancy
                    GestureDetector(
                      onTap: ()=>onClickListener(CaseId.backgroundTransparencyCaseId),
                      child: Container(width: cardWidth*size,height: cardHeight*size,
                        color: Color(ColorValue.backgroundTransparency),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0 * size),
                      child: Stack(
                        children: <Widget>[


                          ///Text Area

                          Positioned(
                            left: Dx.label4* size,
                            bottom: Dy.label4 * size,
                            child: GestureDetector(onTap: ()=>onClickListener(CaseId.label4CaseId),
                              child: Container( padding: EdgeInsets.symmetric(vertical: PaddingValue.label4Vertical,horizontal: PaddingValue.label4Horizontal),
                                decoration: BoxDecoration(color:Color(ColorValue.text4Background),
                                    ///Radius label4
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(RadiusValue.label4TopRight*size),topLeft:  Radius.circular(RadiusValue.label4TopLeft*size),bottomRight:  Radius.circular(RadiusValue.label4BottomRight*size),bottomLeft:  Radius.circular(RadiusValue.label4BottomLeft*size))),

                                child:
                                CardText(
                                  sizeRatio: widget.sizeRatio,
                                  caseId: CaseId.label4CaseId,
                                  cardTextBoxStyle:TextBoxDesign.lv4,
                                  label: 'Id',value: '9876456',


                                ),

                              ),
                            ),
                          ),
                          Positioned(
                            left: Dx.label5 * size,
                            bottom: Dy.label5 * size,
                            child: GestureDetector(onTap: ()=>onClickListener(CaseId.label5CaseId),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: PaddingValue.label5,horizontal: PaddingValue.label5),
                                decoration:BoxDecoration(    color:Color(ColorValue.text5Background),
                                    ///Radius label5
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(RadiusValue.label5TopRight*size),topLeft:  Radius.circular(RadiusValue.label5TopLeft*size),bottomRight:  Radius.circular(RadiusValue.label5BottomRight*size),bottomLeft:  Radius.circular(RadiusValue.label5BottomLeft*size))),

                                child:   CardText(
                                  sizeRatio: widget.sizeRatio,
                                  caseId: CaseId.label5CaseId,
                                  cardTextBoxStyle:TextBoxDesign.lv5,
                                  label: 'Address',value: 'Mardan/Hathain',


                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: Dx.label6 * size,
                            bottom: Dy.label6 * size,
                            child: GestureDetector(onTap: ()=>onClickListener(CaseId.label6CaseId),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: PaddingValue.label6Vertical,horizontal: PaddingValue.label6Horizontal),
                                decoration:BoxDecoration(    color:Color(ColorValue.text6Background),
                                    ///Radius label6
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(RadiusValue.label6TopRight*size),topLeft:  Radius.circular(RadiusValue.label6TopLeft*size),bottomRight:  Radius.circular(RadiusValue.label6BottomRight*size),bottomLeft:  Radius.circular(RadiusValue.label6BottomLeft*size))),


                                child:   CardText(
                                  sizeRatio: widget.sizeRatio,
                                  caseId: CaseId.label6CaseId,
                                  cardTextBoxStyle:TextBoxDesign.lv6,
                                  label: 'Email',value: 'mehran@kateintl.com',


                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: Dx.label7 * size,
                            bottom: Dy.label7 * size,
                            child: GestureDetector(onTap: ()=>onClickListener(CaseId.label7CaseId),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: PaddingValue.label7Vertical,horizontal: PaddingValue.label7Horizontal),
                                decoration:BoxDecoration(    color:Color(ColorValue.text7Background),
                                    ///Radius label7
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(RadiusValue.label7TopRight*size),topLeft:  Radius.circular(RadiusValue.label7TopLeft*size),bottomRight:  Radius.circular(RadiusValue.label7BottomRight*size),bottomLeft:  Radius.circular(RadiusValue.label7BottomLeft*size))),


                                child:  CardText(
                                  sizeRatio: widget.sizeRatio,
                                  caseId: CaseId.label7CaseId,
                                  cardTextBoxStyle:TextBoxDesign.lv7,
                                  label: 'Phone',value: '+9230000000009',


                                ),
                              ),
                            ),
                          ),



                          // ignore: deprecated_member_use
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            )



        ),
        style: NeumorphicStyle(
          depth: 8,
          shadowDarkColor: AppDefault.backgroundApp,
          boxShape:
          NeumorphicBoxShape.roundRect(
            BorderRadius.circular(
                AppCard.radiusMedium * size),
          ),
        ),
      ),
    );
    Widget _nonEditable()=>Container(child:

    widget.activeSide==AppCard.front?
    /// FRONT n0n-EDITABLE
    Neumorphic(
      child: Container(
        height: cardHeight * size,
        width: cardWidth * size,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(
              AppCard.radiusMedium * size),
        ),

        child: Container(
          height: cardHeight * size,
          width: cardWidth * size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppCard.radiusMedium * size),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppCard.radiusMedium * size),
            child: Stack(
              children: [
                ///Backgroud Water Mark
                backGroundImageMETRA(size: size,position:_decor!.background!.bgImage),
                ///Backgroud Transperancy
                Container(
                  width: cardWidth*size,height: cardHeight*size,
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(AppCard.radiusMedium*size),
                    color: Color(_decor!.background!.overlayColor!),),

                ),

                Padding(
                  padding: EdgeInsets.all(3.0 * size),
                  child: Stack(
                    children: <Widget>[

                      ///Logo
                      Positioned(
                          bottom: (_decor!.logo!.position!.dy!)* size,
                          left: (_decor!.logo!.position!.dx!) * size,
                          child: logoCard(size: size,isEditable: widget.isEditable)),
                      ///organization name
                      Positioned(
                        bottom: (_decor!.text!.orgName!.position!.dy!) * size,
                        left: (_decor!.text!.orgName!.position!.dx!) * size,
                        child: orgName(isEditable: widget.isEditable,size: size),

                      ),
                      ///Text Area
                      Positioned(
                        left: (_decor!.text!.lv1!.position!.dx!) * size,
                        bottom: (_decor!.text!.lv1!.position!.dy!) * size,
                        child:  Container(
                          padding: EdgeInsets.symmetric(vertical:_decor!.text!.lv1!.padding!.vertical! ,horizontal:_decor!.text!.lv1!.padding!.horizontal! ),
                          decoration:BoxDecoration(    color:Color(_decor!.text!.lv1!.bgColor!),

                            borderRadius: _radius(sizeRatio:size,tl:_decor!.text!.lv1!.radius!.topLeft! ,tr:_decor!.text!.lv1!.radius!.topRight ,bl:_decor!.text!.lv1!.radius!.bottomLeft ,br:_decor!.text!.lv1!.radius!.bottomRight ,),),

                          child:
                          CardText(
                            sizeRatio: widget.sizeRatio,
                            caseId: CaseId.label1CaseId,
                            cardTextBoxStyle:_decor!.text!.lv1!.boxStyle,
                            label: _userCredentials!.lv1!.label,
                            value: _userCredentials!.lv1!.value,

                            isEditable: false,
                            decoration: _decor!.text!.lv1,
                          ),
                        ),

                      ),
                      Positioned(
                        left: (_decor!.text!.lv2!.position!.dx!) * size,
                        bottom: (_decor!.text!.lv2!.position!.dy!) * size,
                        child:  Container( padding: EdgeInsets.symmetric(vertical: _decor!.text!.lv2!.padding!.vertical!,horizontal: _decor!.text!.lv2!.padding!.horizontal!),
                          decoration:BoxDecoration(    color:Color(_decor!.text!.lv2!.bgColor!),

                            borderRadius:_radius(sizeRatio:size,tl:_decor!.text!.lv2!.radius!.topLeft! ,tr:_decor!.text!.lv2!.radius!.topRight ,bl:_decor!.text!.lv2!.radius!.bottomLeft ,br:_decor!.text!.lv2!.radius!.bottomRight ,),),


                          child:
                          CardText(
                            sizeRatio: widget.sizeRatio,
                            caseId: CaseId.label2CaseId,
                            cardTextBoxStyle:_decor!.text!.lv2!.boxStyle,
                            label: _userCredentials!.lv2!.label,
                            value:_userCredentials!.lv2!.value,
                            isEditable: false,
                            decoration: _decor!.text!.lv2,
                          ),

                        ),

                      ),
                      Positioned(
                        left: (_decor!.text!.lv3!.position!.dx!) * size,
                        bottom: (_decor!.text!.lv3!.position!.dy! )* size,
                        child:  Container(
                          padding: EdgeInsets.symmetric(vertical:_decor!.text!.lv3!.padding!.vertical! ,horizontal:_decor!.text!.lv3!.padding!.horizontal! ),
                          decoration:BoxDecoration(    color:Color(_decor!.text!.lv3!.bgColor!),

                            borderRadius:_radius(sizeRatio:size,tl:_decor!.text!.lv3!.radius!.topLeft! ,tr:_decor!.text!.lv3!.radius!.topRight ,bl:_decor!.text!.lv7!.radius!.bottomLeft ,br:_decor!.text!.lv3!.radius!.bottomRight ,),),
                          child:

                          CardText(
                            sizeRatio: widget.sizeRatio,
                            caseId: CaseId.label3CaseId,
                            cardTextBoxStyle:_decor!.text!.lv3!.boxStyle,
                            label: _userCredentials!.lv3!.label,
                            value:_userCredentials!.lv3!.value,
                            isEditable: false,
                            decoration: _decor!.text!.lv3,
                          ),
                        ),

                      ),
                      ///Profile Image
                      Positioned(
                          bottom: (_decor!.profile!.position!.dy!)* size,
                          left: (_decor!.profile!.position!.dx!) * size,
                          child:  profileCard(size: size,isEditable: false)),

                      ///QR Code Image
                      Positioned(
                          left: (_decor!.qrCode!.position!.dx!) * size,
                          bottom: (_decor!.qrCode!.position!.dy!) * size,
                          child: qrCodeCard(size: size,isEditable: false)),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      style: NeumorphicStyle(
        depth: 8,
        shadowDarkColor: AppDefault.backgroundApp,
        boxShape:
        NeumorphicBoxShape.roundRect(
          BorderRadius.circular(
              AppCard.radiusMedium * size),
        ),
      ),
    ):
    /// BACK n0n-EDITABLE
    Neumorphic(
      child: Container(
          height: cardHeight * size,
          width: cardWidth * size,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(
                AppCard.radiusMedium * size),
          ),
          child:

          Container(
            height: cardHeight * size,
            width: cardWidth * size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppCard.radiusMedium * size),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppCard.radiusMedium * size),
              child: Stack(
                children: [
                  ///Backgroud Water Mark
                  backGroundImageMETRA(size: size,position: _decor!.background!.bgImage),
                  ///Backgroud Transperancy
                  Container(width: AppCard.cardWidth*size,height: AppCard.cardHeight*size,
                    color: Color(_decor!.background!.overlayColor!),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3 * size),
                    child: Stack(
                      children: <Widget>[


                        ///Text Area

                        Positioned(
                          left: (_decor!.text!.lv4!.position!.dx)! * size,
                          bottom: (_decor!.text!.lv4!.position!.dy)! * size,
                          child:Container(
                            padding: EdgeInsets.symmetric(vertical: (_decor!.text!.lv4!.padding!.vertical!)*size,horizontal: (_decor!.text!.lv4!.padding!.horizontal!)*size),
                            decoration:BoxDecoration(    color:Color(_decor!.text!.lv4!.bgColor!),

                              borderRadius:_radius(sizeRatio:size,tl:_decor!.text!.lv4!.radius!.topLeft! ,tr:_decor!.text!.lv4!.radius!.topRight ,bl:_decor!.text!.lv4!.radius!.bottomLeft ,br:_decor!.text!.lv4!.radius!.bottomRight ,),
                            ),

                            child:  CardText(
                              sizeRatio: widget.sizeRatio,
                              caseId: CaseId.label4CaseId,
                              cardTextBoxStyle:_decor!.text!.lv4!.boxStyle,
                              label: _userCredentials!.lv4!.label,
                              value: _userCredentials!.lv4!.value,
                              isEditable: false,
                              decoration: _decor!.text!.lv4,
                            ),
                          ),

                        ),
                        Positioned(
                          left: (_decor!.text!.lv5!.position!.dx!) * size,
                          bottom: (_decor!.text!.lv5!.position!.dy!) * size,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: (_decor!.text!.lv5!.padding!.vertical!)*size,
                                horizontal: (_decor!.text!.lv5!.padding!.horizontal!)*size),
                            decoration:BoxDecoration(    color:Color(_decor!.text!.lv5!.bgColor!),

                              borderRadius:_radius(sizeRatio:size,tl:_decor!.text!.lv5!.radius!.topLeft! ,tr:_decor!.text!.lv5!.radius!.topRight ,bl:_decor!.text!.lv5!.radius!.bottomLeft ,br:_decor!.text!.lv5!.radius!.bottomRight ,),),


                            child:  CardText(
                              sizeRatio: widget.sizeRatio,
                              caseId: CaseId.label5CaseId,
                              cardTextBoxStyle:_decor!.text!.lv5!.boxStyle,
                              label: _userCredentials!.lv5!.label,
                              value: _userCredentials!.lv5!.value,
                              isEditable: false,
                              decoration: _decor!.text!.lv5,
                            ),
                          ),),
                        Positioned(
                          left: (_decor!.text!.lv6!.position!.dx!) * size,
                          bottom: (_decor!.text!.lv6!.position!.dy!) * size,
                          child:  Container(
                            padding: EdgeInsets.symmetric(
                                vertical: (_decor!.text!.lv6!.padding!.vertical!)*size,
                                horizontal: (_decor!.text!.lv6!.padding!.horizontal!)*size),
                            decoration:BoxDecoration(    color:Color(_decor!.text!.lv6!.bgColor!),

                              borderRadius:_radius(sizeRatio:size,tl:_decor!.text!.lv6!.radius!.topLeft! ,tr:_decor!.text!.lv6!.radius!.topRight ,bl:_decor!.text!.lv6!.radius!.bottomLeft ,br:_decor!.text!.lv6!.radius!.bottomRight ,),),


                            child:  CardText(
                              sizeRatio: widget.sizeRatio,
                              caseId: CaseId.label6CaseId,
                              cardTextBoxStyle:_decor!.text!.lv6!.boxStyle,
                              label: _userCredentials!.lv6!.label,
                              value: _userCredentials!.lv6!.value,
                              isEditable: false,
                              decoration: _decor!.text!.lv6,
                            ),
                          ),

                        ),
                        Positioned(
                          left: (_decor!.text!.lv7!.position!.dx!) * size,
                          bottom: (_decor!.text!.lv7!.position!.dy!) * size,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: (_decor!.text!.lv7!.padding!.vertical!)*size,
                                horizontal: (_decor!.text!.lv7!.padding!.horizontal!)*size),
                            decoration:BoxDecoration(    color:Color(_decor!.text!.lv7!.bgColor!),

                              borderRadius:_radius(sizeRatio:size,tl:_decor!.text!.lv7!.radius!.topLeft! ,tr:_decor!.text!.lv7!.radius!.topRight ,bl:_decor!.text!.lv7!.radius!.bottomLeft ,br:_decor!.text!.lv7!.radius!.bottomRight ,),),


                            child:  CardText(
                              sizeRatio: widget.sizeRatio,
                              caseId: CaseId.label7CaseId,
                              cardTextBoxStyle:_decor!.text!.lv7!.boxStyle,
                              label: _userCredentials!.lv7!.label,
                              value: _userCredentials!.lv7!.value,
                              isEditable: false,
                              decoration: _decor!.text!.lv7,
                            ),
                          ),

                        ),



                        // ignore: deprecated_member_use
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )



      ),
      style: NeumorphicStyle(
        depth: 8,
        shadowDarkColor: AppDefault.backgroundApp,
        boxShape:
        NeumorphicBoxShape.roundRect(
          BorderRadius.circular(
              AppCard.radiusMedium * size),
        ),
      ),
    ),
    );
    return
      isEditable == true ?
      ///Editable side
      _editableCard() :
      ///Non-Editable side
      _nonEditable();

  }



  Widget qrCodeCard({double size = 1,bool isEditable=false}) {
   ///local method


    return QrImage(
      data:haveUserCredentials?widget.userData!.qrCode??Global.instance.qrEncryptor(userId: _userCredentials!.id):'demo data',
      version: QrVersions.auto,
      foregroundColor: Color(isEditable?ColorValue.qr:_decor!.qrCode!.color!),
      size: (isEditable?SizeValue.qr:_decor!.qrCode!.size!) * size,
      gapless: false,
      backgroundColor: Color(isEditable?ColorValue.qrBackground:_decor!.qrCode!.bgColor!),
      // embeddedImage: qrEmbedImage,
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: Size(10, 10),
      ),
    );
  }


  Widget logoCard({double size=1,bool isEditable=false}){
    var serverLogo,demoLogo;
    demoLogo=Image.asset(
      'assets/images/logoicon.png',
      //As Logo's width is 1.3 times greater than its height
      width:(isEditable?SizeValue.logo:_decor!.logo!.size)! * 1.3*size ,
      height: (isEditable?SizeValue.logo:_decor!.logo!.size)!*size,

    );
    /// if statement is used to avoid "null-check" error  while widget.userData is null in editable mode
    if(haveUserCredentials){serverLogo=Image.network(
      'http://$androidLocalHost:8080/${widget.userData!.logo}',
      // Logo's width is 1.3 times greater than Logo's height
      width: (isEditable?SizeValue.logo:_decor!.logo!.size)! * 1.3*size ,
      height: (isEditable?SizeValue.logo:_decor!.logo!.size)!*size,
    );}
    return  Container(
      padding:EdgeInsets.symmetric(vertical: (isEditable?PaddingValue.logoVertical:_decor!.logo!.padding!.vertical)!*size,horizontal: (isEditable?PaddingValue.logoHorizontal:_decor!.logo!.padding!.horizontal)!*size),
      decoration: BoxDecoration(borderRadius: isEditable?BorderRadius.only(
        topRight:
        Radius.circular(RadiusValue.logoTopRight*size),
        topLeft:
        Radius.circular(RadiusValue.logoTopLeft*size),
        bottomRight:
        Radius.circular(RadiusValue.logoBottomRight*size),
        bottomLeft:
        Radius.circular(RadiusValue.logoBottomLeft*size),):_radius(sizeRatio:size,tl:_decor!.profile!.radius!.topLeft! ,tr:_decor!.profile!.radius!.topRight! ,bl:_decor!.profile!.radius!.bottomLeft ,br:_decor!.profile!.radius!.bottomRight ,),
          color: Color(isEditable?ColorValue.logoBackground:_decor!.logo!.bgcolor!)),
      ///haveUserCredentials is true then  logo value '00' is just demo
      child:   haveUserCredentials?widget.userData!.logo!='00'? serverLogo :demoLogo:demoLogo,
    );
  }


  Widget profileCard({double size=1,bool isEditable=false}){
    var demoImage,serverImage;
    demoImage=Image.asset(
      'assets/images/OIP.png',
      width: (isEditable?SizeValue.profile:_decor!.profile!.size)! *size* 0.90 ,
      height:(isEditable?SizeValue.profile:_decor!.profile!.size)! *size* 1.2 ,
    );
    /// if statement is used to avoid "null-check" error  while widget.userData is null in editable mode
    if(haveUserCredentials){serverImage=Image.network(
      'http://$androidLocalHost:8080/${_userCredentials!.profile}',
        fit:BoxFit.fill,
      width: (isEditable?SizeValue.profile:_decor!.profile!.size)! *size* 0.90 ,
      height: (isEditable?SizeValue.profile:_decor!.profile!.size)! *size* 1.2 ,
    );}

    return
      // borderRadius: BorderRadius.circular(10),
      Container(
        padding: EdgeInsets.symmetric(vertical: (isEditable?PaddingValue.profileVertical:_decor!.profile!.padding!.vertical!)*size,horizontal: (isEditable?PaddingValue.profileHorizontal:_decor!.profile!.padding!.horizontal!)*size),
        decoration: BoxDecoration( borderRadius:isEditable?BorderRadius.only(
          topRight:
          Radius.circular(RadiusValue.profileTopRight*size),
          topLeft:
          Radius.circular(RadiusValue.profileTopLeft*size),
          bottomRight:
          Radius.circular(RadiusValue.profileBottomRight*size),
          bottomLeft:
          Radius.circular(RadiusValue.profileBottomLeft*size),): _radius(sizeRatio:size,tl:_decor!.profile!.radius!.topLeft! ,tr:_decor!.profile!.radius!.topRight ,bl:_decor!.profile!.radius!.bottomLeft ,br:_decor!.profile!.radius!.bottomRight ,),color: Color(isEditable?ColorValue.profileBackground:_decor!.profile!.bgcolor),),

        child:ClipRRect(borderRadius:isEditable?BorderRadius.only(
        topRight:
        Radius.circular(RadiusValue.profileTopRight*size),
        topLeft:
        Radius.circular(RadiusValue.profileTopLeft*size),
        bottomRight:
        Radius.circular(RadiusValue.profileBottomRight*size),
        bottomLeft:
        Radius.circular(RadiusValue.profileBottomLeft*size),): _radius(sizeRatio:size,tl:_decor!.profile!.radius!.topLeft! ,tr:_decor!.profile!.radius!.topRight ,bl:_decor!.profile!.radius!.bottomLeft ,br:_decor!.profile!.radius!.bottomRight ,),
        child: haveUserCredentials?widget.userData!.profile!='00'? serverImage:demoImage:demoImage,)

      );
  }



  Widget orgName({isEditable = false,size=1,}){
    var currentCompanyName=Boxes.instance.currentCompanyBox.isNotEmpty?Boxes.instance.currentCompanyBox.get(Boxes.CurrentCompanyKey)[1]:'METRA DEMO';
    return

      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            vertical: (isEditable?PaddingValue.organizationNameVertical:_decor!.text!.orgName!.padding!.vertical!) * size,
            horizontal:(isEditable?PaddingValue.organizationNameHorizontal:_decor!.text!.orgName!.padding!.horizontal!) * size),


        decoration: BoxDecoration(color:Color(isEditable?ColorValue.organizationBackground:_decor!.text!.orgName!.bgColor!),
            borderRadius: isEditable?BorderRadius.only(
              topRight:
              Radius.circular(RadiusValue.organizationTopRight*size),
              topLeft:
              Radius.circular(RadiusValue.organizationTopLeft*size),
              bottomRight:
              Radius.circular(RadiusValue.organizationBottomRight*size),
              bottomLeft:
              Radius.circular(RadiusValue.organizationBottomLeft*size),):_radius(sizeRatio:size,tl:_decor!.text!.orgName!.radius!.topLeft,tr:_decor!.text!.orgName!.radius!.topRight,
              br: _decor!.text!.orgName!.radius!.bottomRight,bl: _decor!.text!.orgName!.radius!.bottomLeft,
            )),
        child: Text(isEditable?AppCard.orgName:currentCompanyName,textAlign: TextAlign.center,
          style: TextStyle(

              fontSize:(isEditable?SizeValue.organizationText:_decor!.text!.orgName!.valueSize)!*size/1.20,
              fontFamily: isEditable?FontsValue.organizationName.toString():_decor!.text!.orgName!.valueFontFamily,
              color: Color(isEditable?ColorValue.organizationText:_decor!.text!.orgName!.valueColor!)

          ),
        ),
      )
    // )
        ;
  }



  void callback(){
    var callback=widget.onChange;
    if(callback!=null){
      var a=1;
      callback(a);
    }
  }



  BorderRadius  _radius({double sizeRatio=1,double? tr,double? tl,double? br,double? bl}){return BorderRadius.only(
    topRight:
    Radius.circular(tr!*sizeRatio),
    topLeft:
    Radius.circular(tl!*sizeRatio),
    bottomRight:
    Radius.circular(br!*sizeRatio),
    bottomLeft:
    Radius.circular(bl!*sizeRatio),);}


  void  onClickListener(caseId){
    /// when click on a widget in a card in an editor. this function will be called and assign default values base on its arguments .

    setState(() {
      switch(caseId){
        case CaseId.label1CaseId:
          AppDefault.widgetIdCarrier=CaseId.label1CaseId;
          AppDefault.defaultHorVal=HorizontalSlider.lv1;
          AppDefault.defaultVertVal=VerticalSlider.lv1;
          TextBoxDesign.defaultValue=TextBoxDesign.lv1;
          break;
        case CaseId.label2CaseId:
          AppDefault.widgetIdCarrier=CaseId.label2CaseId;
          AppDefault.defaultHorVal=HorizontalSlider.lv2;
          AppDefault.defaultVertVal=VerticalSlider.lv2;
          TextBoxDesign.defaultValue=TextBoxDesign.lv2;
          break;
        case CaseId.label3CaseId:
          AppDefault.widgetIdCarrier=CaseId.label3CaseId;
          AppDefault.defaultHorVal=HorizontalSlider.lv3;
          AppDefault.defaultVertVal=VerticalSlider.lv3;
          TextBoxDesign.defaultValue=TextBoxDesign.lv3;
          break;
        case CaseId.label4CaseId:
          AppDefault.widgetIdCarrier=CaseId.label4CaseId;
          AppDefault.defaultHorVal=HorizontalSlider.lv4;
          AppDefault.defaultVertVal=VerticalSlider.lv4;

          break;

        case CaseId.label5CaseId:
          AppDefault.widgetIdCarrier=CaseId.label5CaseId;
          AppDefault.defaultHorVal=HorizontalSlider.lv5;
          AppDefault.defaultVertVal=VerticalSlider.lv5;

          break;
        case CaseId.label6CaseId:
          AppDefault.widgetIdCarrier=CaseId.label6CaseId;
          AppDefault.defaultHorVal=HorizontalSlider.lv6;
          AppDefault.defaultVertVal=VerticalSlider.lv6;

          break;
        case CaseId.label7CaseId:
          AppDefault.widgetIdCarrier=CaseId.label7CaseId;
          AppDefault.defaultHorVal=HorizontalSlider.lv7;
          AppDefault.defaultVertVal=HorizontalSlider.lv7;

          break;
        case CaseId.organization:
          AppDefault.textMinimumSize = 30;
          AppDefault.textMaximumSize = 150;
          AppDefault.widgetIdCarrier = CaseId.organization;
          AppDefault.defaultVertVal = VerticalSlider.organization;
          AppDefault.defaultHorVal = HorizontalSlider.organization;
          break;
        case CaseId.logoCaseId:
          AppDefault.textMinimumSize = 20;
          AppDefault.textMaximumSize = 60;
          AppDefault.widgetIdCarrier = CaseId.logoCaseId;
          AppDefault.defaultVertVal = VerticalSlider.logo;
          AppDefault.defaultHorVal = HorizontalSlider.logo;
          AppDefault.seekbarName = 'Logo Size ';
          break;
        case CaseId.profileCaseId:
          AppDefault.textMinimumSize = 35;
          AppDefault.textMaximumSize = 100;
          AppDefault.widgetIdCarrier = CaseId.profileCaseId;
          AppDefault.defaultVertVal = VerticalSlider.profile;
          AppDefault.defaultHorVal = HorizontalSlider.profile;
          AppDefault.seekbarName = 'Profile Size ';
          break;
        case CaseId.backgroundTransparencyCaseId:
          AppDefault.textMinimumSize = 1;
          AppDefault.textMaximumSize = 100;
          AppDefault.widgetIdCarrier = CaseId.backgroundTransparencyCaseId;
          break;
        case CaseId.qrCaseId:
          AppDefault.textMinimumSize = 35;
          AppDefault.textMaximumSize = 100;
          AppDefault.widgetIdCarrier = CaseId.qrCaseId;
          AppDefault.defaultVertVal = VerticalSlider.qr;
          AppDefault.defaultHorVal = HorizontalSlider.qr;
          AppDefault.seekbarName = 'QR code';
          break;
      }
      callback();
    });
  }
}
