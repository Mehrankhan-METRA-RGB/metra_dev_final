import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/rendering.dart';

import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

import '../../Contsants/Data.dart';
import '../../Contsants/app.dart';
import '../../Databases/Boxes/Boxes.dart';
import '../../Databases/saveCardsLocal.dart';
import '../../Models/Models.dart';

class Methods {
  Methods._private();
  static final Methods instance = Methods._private();

  CardModel? _globalCurrentCard = new CardModel(
      text: CardTextModel(
          lv1: CardTextStyle(
            padding: PaddingCard(
                vertical: PaddingValue.label1Vertical,
                horizontal: PaddingValue.label1Horizontal),
            radius: RadiusCard(
              topRight: RadiusValue.label1TopRight,
              topLeft: RadiusValue.label1TopLeft,
              bottomRight: RadiusValue.label1BottomRight,
              bottomLeft: RadiusValue.label1BottomLeft,
            ),
            bgColor: ColorValue.text1Background,
            labelColor: ColorValue.lab1,
            underlineColor: ColorValue.underline1,
            underlineWidth: SizeValue.underlineWidth1,
            underlineHeight: SizeValue.underlineHeight1,
            labelFontFamily: FontsValue.lab1,
            valueFontFamily: FontsValue.txt1,
            valueColor: ColorValue.txt1,
            boxStyle: TextBoxDesign.lv1,
            labelSize: SizeValue.lab1,
            valueSize: SizeValue.txt1,
            position: PositionCard(dx: Dx.label1, dy: Dy.label1),
          ),
          lv2: CardTextStyle(
            padding: PaddingCard(
                vertical: PaddingValue.label2Vertical,
                horizontal: PaddingValue.label2Horizontal),
            radius: RadiusCard(
              topRight: RadiusValue.label2TopRight,
              topLeft: RadiusValue.label2TopLeft,
              bottomRight: RadiusValue.label2BottomRight,
              bottomLeft: RadiusValue.label2BottomLeft,
            ),
            bgColor: ColorValue.text2Background,
            labelColor: ColorValue.lab2,
            underlineColor: ColorValue.underline2,
            underlineWidth: SizeValue.underlineWidth2,
            underlineHeight: SizeValue.underlineHeight2,
            labelFontFamily: FontsValue.lab2,
            valueFontFamily: FontsValue.txt2,
            valueColor: ColorValue.txt2,
            boxStyle: TextBoxDesign.lv2,
            labelSize: SizeValue.lab2,
            valueSize: SizeValue.txt2,
            position: PositionCard(dx: Dx.label2, dy: Dy.label2),
          ),
          lv3: CardTextStyle(
            padding: PaddingCard(
                vertical: PaddingValue.label3Vertical,
                horizontal: PaddingValue.label3Horizontal),
            radius: RadiusCard(
              topRight: RadiusValue.label3TopRight,
              topLeft: RadiusValue.label3TopLeft,
              bottomRight: RadiusValue.label3BottomRight,
              bottomLeft: RadiusValue.label3BottomLeft,
            ),
            bgColor: ColorValue.text3Background,
            labelColor: ColorValue.lab3,
            underlineColor: ColorValue.underline3,
            underlineWidth: SizeValue.underlineWidth3,
            underlineHeight: SizeValue.underlineHeight3,
            labelFontFamily: FontsValue.lab3,
            valueFontFamily: FontsValue.txt3,
            valueColor: ColorValue.txt3,
            boxStyle: TextBoxDesign.lv3,
            labelSize: SizeValue.lab3,
            valueSize: SizeValue.txt3,
            position: PositionCard(dx: Dx.label3, dy: Dy.label3),
          ),
          lv4: CardTextStyle(
            padding: PaddingCard(
                vertical: PaddingValue.label4Vertical,
                horizontal: PaddingValue.label4Horizontal),
            radius: RadiusCard(
              topRight: RadiusValue.label4TopRight,
              topLeft: RadiusValue.label4TopLeft,
              bottomRight: RadiusValue.label4BottomRight,
              bottomLeft: RadiusValue.label4BottomLeft,
            ),
            bgColor: ColorValue.text4Background,
            labelColor: ColorValue.lab4,
            underlineColor: ColorValue.underline4,
            underlineWidth: SizeValue.underlineWidth4,
            underlineHeight: SizeValue.underlineHeight4,
            labelFontFamily: FontsValue.lab4,
            valueFontFamily: FontsValue.txt4,
            valueColor: ColorValue.txt4,
            boxStyle: TextBoxDesign.lv4,
            labelSize: SizeValue.lab4,
            valueSize: SizeValue.txt4,
            position: PositionCard(dx: Dx.label4, dy: Dy.label4),
          ),
          lv5: CardTextStyle(
            padding: PaddingCard(
                vertical: PaddingValue.label5Vertical,
                horizontal: PaddingValue.label5Horizontal),
            radius: RadiusCard(
              topRight: RadiusValue.label5TopRight,
              topLeft: RadiusValue.label5TopLeft,
              bottomRight: RadiusValue.label5BottomRight,
              bottomLeft: RadiusValue.label5BottomLeft,
            ),
            bgColor: ColorValue.text5Background,
            labelColor: ColorValue.lab5,
            underlineColor: ColorValue.underline5,
            underlineWidth: SizeValue.underlineWidth5,
            underlineHeight: SizeValue.underlineHeight5,
            labelFontFamily: FontsValue.lab5,
            valueFontFamily: FontsValue.txt5,
            valueColor: ColorValue.txt5,
            boxStyle: TextBoxDesign.lv5,
            labelSize: SizeValue.lab5,
            valueSize: SizeValue.txt5,
            position: PositionCard(dx: Dx.label5, dy: Dy.label5),
          ),
          lv6: CardTextStyle(
            padding: PaddingCard(
                vertical: PaddingValue.label6Vertical,
                horizontal: PaddingValue.label6Horizontal),
            radius: RadiusCard(
              topRight: RadiusValue.label6TopRight,
              topLeft: RadiusValue.label6TopLeft,
              bottomRight: RadiusValue.label6BottomRight,
              bottomLeft: RadiusValue.label6BottomLeft,
            ),
            bgColor: ColorValue.text6Background,
            labelColor: ColorValue.lab6,
            underlineColor: ColorValue.underline6,
            underlineWidth: SizeValue.underlineWidth6,
            underlineHeight: SizeValue.underlineHeight6,
            labelFontFamily: FontsValue.lab6,
            valueFontFamily: FontsValue.txt6,
            valueColor: ColorValue.txt6,
            boxStyle: TextBoxDesign.lv6,
            labelSize: SizeValue.lab6,
            valueSize: SizeValue.txt6,
            position: PositionCard(dx: Dx.label6, dy: Dy.label6),
          ),
          lv7: CardTextStyle(
            padding: PaddingCard(
                vertical: PaddingValue.label7Vertical,
                horizontal: PaddingValue.label7Horizontal),
            radius: RadiusCard(
              topRight: RadiusValue.label7TopRight,
              topLeft: RadiusValue.label7TopLeft,
              bottomRight: RadiusValue.label7BottomRight,
              bottomLeft: RadiusValue.label7BottomLeft,
            ),
            bgColor: ColorValue.text7Background,
            labelColor: ColorValue.lab7,
            underlineColor: ColorValue.underline7,
            underlineWidth: SizeValue.underlineWidth7,
            underlineHeight: SizeValue.underlineHeight7,
            labelFontFamily: FontsValue.lab7,
            valueFontFamily: FontsValue.txt7,
            valueColor: ColorValue.txt7,
            boxStyle: TextBoxDesign.lv7,
            labelSize: SizeValue.lab7,
            valueSize: SizeValue.txt7,
            position: PositionCard(dx: Dx.label7, dy: Dy.label7),
          ),
          orgName: CardTextStyle(
            padding: PaddingCard(
                vertical: PaddingValue.organizationNameVertical,
                horizontal: PaddingValue.organizationNameHorizontal),
            radius: RadiusCard(
              topRight: RadiusValue.organizationTopRight,
              topLeft: RadiusValue.organizationTopLeft,
              bottomRight: RadiusValue.organizationBottomRight,
              bottomLeft: RadiusValue.organizationBottomLeft,
            ),
            bgColor: ColorValue.organizationBackground,
            // labelColor: Colors.black,
            // underlineColor: 0xfa7,
            valueColor: ColorValue.organizationText,
            // boxStyle: TextBoxStyle.allUpDown,
            // labelSize: 7,
            valueFontFamily: FontsValue.organizationName,
            valueSize: SizeValue.organizationText,
            position: PositionCard(dx: Dx.organization, dy: Dy.organization),
          )),
      logo: CardLogoStyle(
          position: PositionCard(dx: Dx.logo, dy: Dy.logo),
          padding: PaddingCard(
              vertical: PaddingValue.logoVertical,
              horizontal: PaddingValue.logoHorizontal),
          radius: RadiusCard(
            topRight: RadiusValue.logoTopRight,
            topLeft: RadiusValue.logoTopLeft,
            bottomRight: RadiusValue.logoBottomRight,
            bottomLeft: RadiusValue.logoBottomLeft,
          ),
          size: SizeValue.logo,
          bgcolor: ColorValue.logoBackground),
      profile: CardProfileStyle(
          position: PositionCard(dx: Dx.profile, dy: Dy.profile),
          padding: PaddingCard(
              vertical: PaddingValue.profileVertical,
              horizontal: PaddingValue.profileHorizontal),
          radius: RadiusCard(
              topRight: RadiusValue.profileTopRight,
              topLeft: RadiusValue.logoTopLeft,
              bottomRight: RadiusValue.profileBottomRight,
              bottomLeft: RadiusValue.profileBottomLeft),
          size: SizeValue.profile,
          bgcolor: ColorValue.profileBackground),
      background: CardBackgroundStyle(
          overlayColor: ColorValue.backgroundTransparency,
          bgImage: AppDefault.defaultPositionBackgrndImage),
      qrCode: CardQrCodeStyle(
          bgColor: ColorValue.qrBackground,
          color: ColorValue.qr,
          position: PositionCard(dx: Dx.qr, dy: Dy.qr),
          size: SizeValue.qr)
  );

  /// Save

  void saveCard(BuildContext? context) async {
    CardModel? _currentCard = new CardModel(
        text: CardTextModel(
            lv1: CardTextStyle(
              padding: PaddingCard(
                  vertical: PaddingValue.label1Vertical.toDouble(),
                  horizontal: PaddingValue.label1Horizontal.toDouble()),
              radius: RadiusCard(
                topRight: RadiusValue.label1TopRight.toDouble(),
                topLeft: RadiusValue.label1TopLeft.toDouble(),
                bottomRight: RadiusValue.label1BottomRight.toDouble(),
                bottomLeft: RadiusValue.label1BottomLeft.toDouble(),
              ),
              bgColor: ColorValue.text1Background,
              labelColor: ColorValue.lab1,
              underlineColor: ColorValue.underline1,
              underlineWidth: SizeValue.underlineWidth1,
              underlineHeight: SizeValue.underlineHeight1,
              labelFontFamily: FontsValue.lab1,
              valueFontFamily: FontsValue.txt1,
              valueColor: ColorValue.txt1,
              boxStyle: TextBoxDesign.lv1,
              labelSize: SizeValue.lab1,
              valueSize: SizeValue.txt1,
              position: PositionCard(dx: Dx.label1.toDouble(), dy: Dy.label1.toDouble()),
            ),
            lv2: CardTextStyle(
              padding: PaddingCard(
                  vertical: PaddingValue.label2Vertical.toDouble(),
                  horizontal: PaddingValue.label2Horizontal.toDouble()),
              radius: RadiusCard(
                topRight: RadiusValue.label2TopRight.toDouble(),
                topLeft: RadiusValue.label2TopLeft.toDouble(),
                bottomRight: RadiusValue.label2BottomRight.toDouble(),
                bottomLeft: RadiusValue.label2BottomLeft.toDouble(),
              ),
              bgColor: ColorValue.text2Background,
              labelColor: ColorValue.lab2,
              underlineColor: ColorValue.underline2,
              underlineWidth: SizeValue.underlineWidth2,
              underlineHeight: SizeValue.underlineHeight2,
              labelFontFamily: FontsValue.lab2,
              valueFontFamily: FontsValue.txt2,
              valueColor: ColorValue.txt2,
              boxStyle: TextBoxDesign.lv2,
              labelSize: SizeValue.lab2,
              valueSize: SizeValue.txt2,
              position: PositionCard(dx: Dx.label2.toDouble(), dy: Dy.label2.toDouble()),
            ),
            lv3: CardTextStyle(
              padding: PaddingCard(
                  vertical: PaddingValue.label3Vertical.toDouble(),
                  horizontal: PaddingValue.label3Horizontal.toDouble()),
              radius: RadiusCard(
                topRight: RadiusValue.label3TopRight.toDouble(),
                topLeft: RadiusValue.label3TopLeft.toDouble(),
                bottomRight: RadiusValue.label3BottomRight.toDouble(),
                bottomLeft: RadiusValue.label3BottomLeft.toDouble(),
              ),
              bgColor: ColorValue.text3Background,
              labelColor: ColorValue.lab3,
              underlineColor: ColorValue.underline3,
              underlineWidth: SizeValue.underlineWidth3,
              underlineHeight: SizeValue.underlineHeight3,
              labelFontFamily: FontsValue.lab3,
              valueFontFamily: FontsValue.txt3,
              valueColor: ColorValue.txt3,
              boxStyle: TextBoxDesign.lv3,
              labelSize: SizeValue.lab3,
              valueSize: SizeValue.txt3,
              position: PositionCard(dx: Dx.label3.toDouble(), dy: Dy.label3.toDouble()),
            ),
            lv4: CardTextStyle(
              padding: PaddingCard(
                  vertical: PaddingValue.label4Vertical.toDouble(),
                  horizontal: PaddingValue.label4Horizontal.toDouble()),
              radius: RadiusCard(
                topRight: RadiusValue.label4TopRight.toDouble(),
                topLeft: RadiusValue.label4TopLeft.toDouble(),
                bottomRight: RadiusValue.label4BottomRight.toDouble(),
                bottomLeft: RadiusValue.label4BottomLeft.toDouble(),
              ),
              bgColor: ColorValue.text4Background,
              labelColor: ColorValue.lab4,
              underlineColor: ColorValue.underline4,
              underlineWidth: SizeValue.underlineWidth4,
              underlineHeight: SizeValue.underlineHeight4,
              labelFontFamily: FontsValue.lab4,
              valueFontFamily: FontsValue.txt4,
              valueColor: ColorValue.txt4,
              boxStyle: TextBoxDesign.lv4,
              labelSize: SizeValue.lab4,
              valueSize: SizeValue.txt4,
              position: PositionCard(dx: Dx.label4.toDouble(), dy: Dy.label4.toDouble()),
            ),
            lv5: CardTextStyle(
              padding: PaddingCard(
                  vertical: PaddingValue.label5Vertical.toDouble(),
                  horizontal: PaddingValue.label5Horizontal.toDouble()),
              radius: RadiusCard(
                topRight: RadiusValue.label5TopRight.toDouble(),
                topLeft: RadiusValue.label5TopLeft.toDouble(),
                bottomRight: RadiusValue.label5BottomRight.toDouble(),
                bottomLeft: RadiusValue.label5BottomLeft.toDouble(),
              ),
              bgColor: ColorValue.text5Background,
              labelColor: ColorValue.lab5,
              underlineColor: ColorValue.underline5,
              underlineWidth: SizeValue.underlineWidth5,
              underlineHeight: SizeValue.underlineHeight5,
              labelFontFamily: FontsValue.lab5,
              valueFontFamily: FontsValue.txt5,
              valueColor: ColorValue.txt5,
              boxStyle: TextBoxDesign.lv5,
              labelSize: SizeValue.lab5,
              valueSize: SizeValue.txt5,
              position: PositionCard(dx: Dx.label5.toDouble(), dy: Dy.label5.toDouble()),
            ),
            lv6: CardTextStyle(
              padding: PaddingCard(
                  vertical: PaddingValue.label6Vertical.toDouble(),
                  horizontal: PaddingValue.label6Horizontal.toDouble()),
              radius: RadiusCard(
                topRight: RadiusValue.label6TopRight.toDouble(),
                topLeft: RadiusValue.label6TopLeft.toDouble(),
                bottomRight: RadiusValue.label6BottomRight.toDouble(),
                bottomLeft: RadiusValue.label6BottomLeft.toDouble(),
              ),
              bgColor: ColorValue.text6Background,
              labelColor: ColorValue.lab6,
              underlineColor: ColorValue.underline6,
              underlineWidth: SizeValue.underlineWidth6,
              underlineHeight: SizeValue.underlineHeight6,
              labelFontFamily: FontsValue.lab6,
              valueFontFamily: FontsValue.txt6,
              valueColor: ColorValue.txt6,
              boxStyle: TextBoxDesign.lv6,
              labelSize: SizeValue.lab6,
              valueSize: SizeValue.txt6,
              position: PositionCard(dx: Dx.label6.toDouble(), dy: Dy.label6.toDouble()),
            ),
            lv7: CardTextStyle(
              padding: PaddingCard(
                  vertical: PaddingValue.label7Vertical.toDouble(),
                  horizontal: PaddingValue.label7Horizontal.toDouble()),
              radius: RadiusCard(
                topRight: RadiusValue.label7TopRight.toDouble(),
                topLeft: RadiusValue.label7TopLeft.toDouble(),
                bottomRight: RadiusValue.label7BottomRight.toDouble(),
                bottomLeft: RadiusValue.label7BottomLeft.toDouble(),
              ),
              bgColor: ColorValue.text7Background,
              labelColor: ColorValue.lab7,
              underlineColor: ColorValue.underline7,
              underlineWidth: SizeValue.underlineWidth7,
              underlineHeight: SizeValue.underlineHeight7,
              labelFontFamily: FontsValue.lab7,
              valueFontFamily: FontsValue.txt7,
              valueColor: ColorValue.txt7,
              boxStyle: TextBoxDesign.lv7,
              labelSize: SizeValue.lab7,
              valueSize: SizeValue.txt7,
              position: PositionCard(dx: Dx.label7.toDouble(), dy: Dy.label7.toDouble()),
            ),
            orgName: CardTextStyle(
              padding: PaddingCard(
                  vertical: PaddingValue.organizationNameVertical.toDouble(),
                  horizontal: PaddingValue.organizationNameHorizontal.toDouble()),
              radius: RadiusCard(
                topRight: RadiusValue.organizationTopRight.toDouble(),
                topLeft: RadiusValue.organizationTopLeft.toDouble(),
                bottomRight: RadiusValue.organizationBottomRight.toDouble(),
                bottomLeft: RadiusValue.organizationBottomLeft.toDouble(),
              ),
              bgColor: ColorValue.organizationBackground,
              // labelColor: Colors.black,
              // underlineColor: 0xfa7,
              valueColor: ColorValue.organizationText,
              // boxStyle: TextBoxStyle.allUpDown,
              // labelSize: 7,
              valueFontFamily: FontsValue.organizationName,
              valueSize: SizeValue.organizationText,
              position: PositionCard(dx: Dx.organization.toDouble(), dy: Dy.organization.toDouble()),
            )),
        logo: CardLogoStyle(
            position: PositionCard(dx: Dx.logo.toDouble(), dy: Dy.logo.toDouble()),
            padding: PaddingCard(
                vertical: PaddingValue.logoVertical.toDouble(),
                horizontal: PaddingValue.logoHorizontal.toDouble()),
            radius: RadiusCard(
              topRight: RadiusValue.logoTopRight.toDouble(),
              topLeft: RadiusValue.logoTopLeft.toDouble(),
              bottomRight: RadiusValue.logoBottomRight.toDouble(),
              bottomLeft: RadiusValue.logoBottomLeft.toDouble(),
            ),
            size: SizeValue.logo,
            bgcolor: ColorValue.logoBackground),
        profile: CardProfileStyle(
            position: PositionCard(dx: Dx.profile.toDouble(), dy: Dy.profile.toDouble()),
            padding: PaddingCard(
                vertical: PaddingValue.profileVertical.toDouble(),
                horizontal: PaddingValue.profileHorizontal.toDouble()),
            radius: RadiusCard(
                topRight: RadiusValue.profileTopRight.toDouble(),
                topLeft: RadiusValue.logoTopLeft.toDouble(),
                bottomRight: RadiusValue.profileBottomRight.toDouble(),
                bottomLeft: RadiusValue.profileBottomLeft.toDouble()),
            size: SizeValue.profile,
            bgcolor: ColorValue.profileBackground),
        background: CardBackgroundStyle(
            overlayColor: ColorValue.backgroundTransparency,
            bgImage: AppDefault.defaultPositionBackgrndImage),
        qrCode: CardQrCodeStyle(
            bgColor: ColorValue.qrBackground,
            color: ColorValue.qr,
            position: PositionCard(dx: Dx.qr.toDouble(), dy: Dy.qr.toDouble()),
            size: SizeValue.qr));
    String? _card = Methods.instance.cardToJsonEncode(_currentCard);
    SaveCardsLocal saveCardsLocal =
        SaveCardsLocal(details: _card, saveDate: DateTime.now());
    Hive.box<SaveCardsLocal>(Boxes.localSavedCardListKey)
        .add(saveCardsLocal)
        .then(
          (value) => App.snackBar(
            context,
            text: 'The card has been saved in local storage',
          ),
        );
    print('card Saved');
  }

  ///:Activation

  CardModel? get getActivatedCard {
    CardModel? _card;
    if (Boxes.instance.activatedCardBox.containsKey(Boxes.ActivatedCardKey)) {
      var _savedActivatedCard =
          Boxes.instance.activatedCardBox.get(Boxes.ActivatedCardKey);
      SaveCardsLocal? _savedData =
          Boxes.instance.savedLocalCardListBox.get(_savedActivatedCard);
      _card = Methods.instance.encodedJsonToCard(_savedData!.details!);
    } else {
      _card = Methods.instance._globalCurrentCard;
    }

    return _card;
  }

  void activateCard(BuildContext context, {required int? position}) async {
    var snackBar =
        App.snackBar(context, seconds: 3, text: 'Card has been Activated');

    ///where local card list is available
    var _cardListBox = Boxes.instance.savedLocalCardListBox;

    ///where we want to save a key of an activated card
    var activatedCardBox = Boxes.instance.activatedCardBox;

    ///where we got a card key from local card list at particular position and assign it to variable
    var _activatedCardkey = _cardListBox.getAt(position!)!.key;

    /// where we have save an activated card key
    await activatedCardBox
        .put(Boxes.ActivatedCardKey, _activatedCardkey)
        .then((value) => snackBar);

    print('activated card key:$_activatedCardkey');
  }

  ///Assign Card  to static default Variables from Arguments
  void cardCurrentDecoration(CardModel? card) {
    var _lv1 = card!.text!.lv1!;
    var _lv2 = card.text!.lv2!;
    var _lv3 = card.text!.lv3!;
    var _lv4 = card.text!.lv4!;
    var _lv5 = card.text!.lv5!;
    var _lv6 = card.text!.lv6!;
    var _org = card.text!.orgName!;
    var _lv7 = card.text!.lv7!;
    var _profile = card.profile!;
    var _logo = card.logo!;
    var _qr = card.qrCode!;
    var _background = card.background!;
    ColorValue.organizationBackground = _org.bgColor!;
    ColorValue.organizationText = _org.valueColor!;
    // ColorValue.label =;
    // ColorValue.labelBackground =;
    // ColorValue.text =;
    // ColorValue.textBackground =;
    // ColorValue.profileColorValue =_profile.bgcolor;
    ColorValue.profileBackground = _profile.bgcolor;
    ColorValue.qr = _qr.color!;
    ColorValue.qrBackground = _qr.bgColor!;
    // ColorValue.logo =_logo.bgcolor;
    ColorValue.logoBackground = _logo.bgcolor!;
    // ColorValue.underLine =;
    //

    ColorValue.backgroundTransparency = _background.overlayColor!;
    ColorValue.selectedCardDesignBackground = _background.bgImage!;
    // ColorValue.label1Background =_lv1.;
    // ColorValue.label2Background =;
    // ColorValue.label3Background =;
    // ColorValue.label4Background =;
    // ColorValue.label5Background =;
    // ColorValue.label6Background =;
    // ColorValue.label7Background =;
    ColorValue.text1Background = _lv1.bgColor!;
    ColorValue.text2Background = _lv2.bgColor!;
    ColorValue.text3Background = _lv3.bgColor!;
    ColorValue.text4Background = _lv4.bgColor!;
    ColorValue.text5Background = _lv5.bgColor!;
    ColorValue.text6Background = _lv6.bgColor!;
    ColorValue.text7Background = _lv7.bgColor!;

    ColorValue.lab1 = _lv1.labelColor!;
    ColorValue.lab2 = _lv2.labelColor!;
    ColorValue.lab3 = _lv3.labelColor!;
    ColorValue.lab4 = _lv4.labelColor!;
    ColorValue.lab5 = _lv5.labelColor!;
    ColorValue.lab6 = _lv6.labelColor!;
    ColorValue.lab7 = _lv7.labelColor!;

    ColorValue.txt1 = _lv1.valueColor!;
    ColorValue.txt2 = _lv2.valueColor!;
    ColorValue.txt3 = _lv3.valueColor!;
    ColorValue.txt4 = _lv4.valueColor!;
    ColorValue.txt5 = _lv5.valueColor!;
    ColorValue.txt6 = _lv6.valueColor!;
    ColorValue.txt7 = _lv7.valueColor!;

    ColorValue.underline1 = _lv1.underlineColor!;
    ColorValue.underline2 = _lv2.underlineColor!;
    ColorValue.underline3 = _lv3.underlineColor!;
    ColorValue.underline4 = _lv4.underlineColor!;
    ColorValue.underline5 = _lv5.underlineColor!;
    ColorValue.underline6 = _lv6.underlineColor!;
    ColorValue.underline7 = _lv7.underlineColor!;

    SizeValue.organizationText = _org.valueSize!;
    // SizeValue.labels = ;
    // SizeValue.text = ;
    SizeValue.profile = _profile.size!;
    SizeValue.qr = _qr.size!;
    SizeValue.logo = _logo.size!;

    SizeValue.underlineHeight1 = _lv1.underlineHeight!;
    SizeValue.underlineHeight2 = _lv2.underlineHeight!;
    SizeValue.underlineHeight3 = _lv3.underlineHeight!;
    SizeValue.underlineHeight4 = _lv4.underlineHeight!;
    SizeValue.underlineHeight5 = _lv5.underlineHeight!;
    SizeValue.underlineHeight6 = _lv6.underlineHeight!;
    SizeValue.underlineHeight7 = _lv7.underlineHeight!;

    SizeValue.underlineWidth1 = _lv1.underlineWidth!;
    SizeValue.underlineWidth2 = _lv2.underlineWidth!;
    SizeValue.underlineWidth3 = _lv3.underlineWidth!;
    SizeValue.underlineWidth4 = _lv4.underlineWidth!;
    SizeValue.underlineWidth5 = _lv5.underlineWidth!;
    SizeValue.underlineWidth6 = _lv6.underlineWidth!;
    SizeValue.underlineWidth7 = _lv7.underlineWidth!;

    SizeValue.organizationBoxWidth = _org.underlineWidth!;

    SizeValue.lab1 = _lv1.labelSize!;
    SizeValue.lab2 = _lv2.labelSize!;
    SizeValue.lab3 = _lv3.labelSize!;
    SizeValue.lab4 = _lv4.labelSize!;
    SizeValue.lab5 = _lv5.labelSize!;
    SizeValue.lab6 = _lv6.labelSize!;
    SizeValue.lab7 = _lv7.labelSize!;

    SizeValue.txt1 = _lv1.valueSize!;
    SizeValue.txt2 = _lv2.valueSize!;
    SizeValue.txt3 = _lv3.valueSize!;
    SizeValue.txt4 = _lv4.valueSize!;
    SizeValue.txt5 = _lv5.valueSize!;
    SizeValue.txt6 = _lv6.valueSize!;
    SizeValue.txt7 = _lv7.valueSize!;

    FontsValue.lab1 = _lv1.labelFontFamily!;
    FontsValue.txt1 = _lv1.valueFontFamily!;
    FontsValue.lab2 = _lv2.labelFontFamily!;
    FontsValue.txt2 = _lv2.valueFontFamily!;
    FontsValue.lab3 = _lv3.labelFontFamily!;
    FontsValue.txt3 = _lv3.valueFontFamily!;
    FontsValue.lab4 = _lv4.labelFontFamily!;
    FontsValue.txt4 = _lv4.valueFontFamily!;
    FontsValue.lab5 = _lv5.labelFontFamily!;
    FontsValue.txt5 = _lv5.valueFontFamily!;
    FontsValue.lab6 = _lv6.labelFontFamily!;
    FontsValue.txt6 = _lv6.valueFontFamily!;
    FontsValue.lab7 = _lv7.labelFontFamily!;
    FontsValue.txt7 = _lv7.valueFontFamily!;
    FontsValue.organizationName = _org.valueFontFamily!;

    // PaddingValue.profile.toDouble() = _profile.padding!.horizontal!;
    PaddingValue.profileVertical = _profile.padding!.vertical!;
    PaddingValue.profileHorizontal = _profile.padding!.horizontal!;
    // PaddingValue.logo.toDouble() = ;
    PaddingValue.organizationNameVertical = _org.padding!.vertical!;
    PaddingValue.organizationNameHorizontal = _org.padding!.horizontal!;

    PaddingValue.logoVertical = _logo.padding!.vertical!;
    PaddingValue.logoHorizontal = _logo.padding!.horizontal!;
    // PaddingValue.underLine.toDouble() = ;
    // PaddingValue.label1.toDouble() = ;
    PaddingValue.label1Vertical = _lv1.padding!.vertical!;
    PaddingValue.label1Horizontal = _lv1.padding!.horizontal!;
    // // PaddingValue.label2.toDouble() = ;
    PaddingValue.label2Vertical = _lv2.padding!.vertical!;
    PaddingValue.label2Horizontal = _lv2.padding!.horizontal!;
    // // PaddingValue.label3.toDouble() = ;
    PaddingValue.label3Vertical = _lv3.padding!.vertical!;
    PaddingValue.label3Horizontal = _lv3.padding!.horizontal!;
    // // PaddingValue.label4.toDouble() = ;
    PaddingValue.label4Vertical = _lv4.padding!.vertical!;
    PaddingValue.label4Horizontal = _lv4.padding!.horizontal!;
    // // PaddingValue.label5.toDouble() = ;
    PaddingValue.label5Vertical = _lv5.padding!.vertical!;
    PaddingValue.label5Horizontal = _lv5.padding!.horizontal!;
    // // PaddingValue.label6.toDouble() = ;
    PaddingValue.label6Vertical = _lv6.padding!.vertical!;
    PaddingValue.label6Horizontal = _lv6.padding!.horizontal!;
    // // PaddingValue.label7.toDouble() = ;
    PaddingValue.label7Vertical = _lv7.padding!.vertical!;
    PaddingValue.label7Horizontal = _lv7.padding!.horizontal!;

    TextBoxDesign.lv1 = _lv1.boxStyle!;
    TextBoxDesign.lv2 = _lv2.boxStyle!;
    TextBoxDesign.lv3 = _lv3.boxStyle!;
    TextBoxDesign.lv4 = _lv4.boxStyle!;
    TextBoxDesign.lv5 = _lv5.boxStyle!;
    TextBoxDesign.lv6 = _lv6.boxStyle!;
    TextBoxDesign.lv7 = _lv7.boxStyle!;

    RadiusValue.organizationTopLeft = _org.radius!.topLeft!;
    RadiusValue.organizationTopRight = _org.radius!.topRight!;
    RadiusValue.organizationBottomLeft = _org.radius!.bottomLeft!;
    RadiusValue.organizationBottomRight = _org.radius!.bottomRight!;

    RadiusValue.profileTopLeft = _profile.radius!.topLeft!;
    RadiusValue.profileTopRight = _profile.radius!.topRight!;
    RadiusValue.profileBottomLeft = _profile.radius!.bottomLeft!;
    RadiusValue.profileBottomRight = _profile.radius!.bottomRight!;

    RadiusValue.logoTopLeft = _logo.radius!.topLeft!;
    RadiusValue.logoTopRight = _logo.radius!.topRight!;
    RadiusValue.logoBottomLeft = _logo.radius!.bottomLeft!;
    RadiusValue.logoBottomRight = _logo.radius!.bottomRight!;

    RadiusValue.label1TopLeft = _lv1.radius!.topLeft!;
    RadiusValue.label1TopRight = _lv1.radius!.topRight!;
    RadiusValue.label1BottomLeft = _lv1.radius!.bottomLeft!;
    RadiusValue.label1BottomRight = _lv1.radius!.bottomRight!;

    RadiusValue.label2TopLeft = _lv2.radius!.topLeft!;
    RadiusValue.label2TopRight = _lv2.radius!.topRight!;
    RadiusValue.label2BottomLeft = _lv2.radius!.bottomLeft!;
    RadiusValue.label2BottomRight = _lv2.radius!.bottomRight!;

    RadiusValue.label3TopLeft = _lv3.radius!.topLeft!;
    RadiusValue.label3TopRight = _lv3.radius!.topRight!;
    RadiusValue.label3BottomLeft = _lv3.radius!.bottomLeft!;
    RadiusValue.label3BottomRight = _lv3.radius!.bottomRight!;

    RadiusValue.label4TopLeft = _lv4.radius!.topLeft!;
    RadiusValue.label4TopRight = _lv4.radius!.topRight!;
    RadiusValue.label4BottomLeft = _lv4.radius!.bottomLeft!;
    RadiusValue.label4BottomRight = _lv4.radius!.bottomRight!;

    RadiusValue.label5TopLeft = _lv5.radius!.topLeft!;
    RadiusValue.label5TopRight = _lv5.radius!.topRight!;
    RadiusValue.label5BottomLeft = _lv5.radius!.bottomLeft!;
    RadiusValue.label5BottomRight = _lv5.radius!.bottomRight!;

    RadiusValue.label6TopLeft = _lv6.radius!.topLeft!;
    RadiusValue.label6TopRight = _lv6.radius!.topRight!;
    RadiusValue.label6BottomLeft = _lv6.radius!.bottomLeft!;
    RadiusValue.label6BottomRight = _lv6.radius!.bottomRight!;

    RadiusValue.label7TopLeft = _lv7.radius!.topLeft!;
    RadiusValue.label7TopRight = _lv7.radius!.topRight!;
    RadiusValue.label7BottomLeft = _lv7.radius!.bottomLeft!;
    RadiusValue.label7BottomRight = _lv7.radius!.bottomRight!;

    Dy.organization = _org.position!.dy!;
    Dy.profile = _profile.position!.dy!;
    Dy.qr = _qr.position!.dy!;
    Dy.logo = _logo.position!.dy!;
    Dy.label1 = _lv1.position!.dy!;
    Dy.label2 = _lv2.position!.dy!;
    Dy.label3 = _lv3.position!.dy!;
    Dy.label4 = _lv4.position!.dy!;
    Dy.label5 = _lv5.position!.dy!;
    Dy.label6 = _lv6.position!.dy!;
    Dy.label7 = _lv7.position!.dy!;

    Dx.organization = _org.position!.dx!;
    Dx.profile = _profile.position!.dx!;
    Dx.qr = _qr.position!.dx!;
    Dx.logo = _logo.position!.dx!;
    Dx.label1 = _lv1.position!.dx!;
    Dx.label2 = _lv2.position!.dx!;
    Dx.label3 = _lv3.position!.dx!;
    Dx.label4 = _lv4.position!.dx!;
    Dx.label5 = _lv5.position!.dx!;
    Dx.label6 = _lv6.position!.dx!;
    Dx.label7 = _lv7.position!.dx!;
  }

  ///:Conversions



  /// Default Card to JsonEncoded  String
  String get currentCardToJsonEncode {
    var _jsonEncode = jsonEncode(Methods.instance._globalCurrentCard);
    return _jsonEncode;
  }

  /// Card to Json Encoded
  String cardToJsonEncode(card) {
    var _jsonEncode = jsonEncode(card);
    return _jsonEncode;
  }

  ///capture image from card  widget
  Future<ByteData>  capturePng({required cardSideKey}) async {
    RenderRepaintBoundary boundary =
        cardSideKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage(pixelRatio: 3);
    ByteData byteData = (await image.toByteData(format: ImageByteFormat.png))!;

    return byteData;
  }

  ///Convert String to Uint8List
  ///use to bring Uint8List data from saved string
  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return unit8List;
  }

  ///  Convert Uint8List to String
  ///  use to save these string data in HIVE database
  String convertUint8ListToString(Uint8List uint8list) {
    return String.fromCharCodes(uint8list);
  }

  /// Encoded JSON String to Type Card Model
  CardModel encodedJsonToCard(String jsonEncoded) {
    var _jsonDecode = jsonDecode(jsonEncoded);
    CardModel _cardModel = CardModel.fromJson(_jsonDecode);
    return _cardModel;
  }
}
