
import '../../../Contsants/Data.dart';


class Conditions {
  static const String onchange = 'onchange';
  static const String value = 'value';
  static int recentColorPosition = 0;
  static double sizeSliderValue(
      {required caseId,
      conditionReturnType = Conditions.value,
      double onchangeCallbackValue = 1}) {
    double a = onchangeCallbackValue;
    switch (conditionReturnType) {

      ///value
      case Conditions.value:
        switch (caseId) {
          case CaseId.textCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                a=SizeValue.txt1;
                break;
              case CaseId.label2CaseId:
                a=SizeValue.txt2;
                break;
              case CaseId.label2CaseId:
                a=SizeValue.txt2;
                break;
              case CaseId.label3CaseId:
                a=SizeValue.txt3;
                break;
              case CaseId.label4CaseId:
                a=SizeValue.txt4;
                break;
              case CaseId.label5CaseId:
                a=SizeValue.txt5;
                break;
              case CaseId.label6CaseId:
                a=SizeValue.txt6;
                break;
              case CaseId.label7CaseId:
                a=SizeValue.txt7;
                break;

            }
            // a = SizeValue.text;
            break;
          case CaseId.labelTextCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                a=SizeValue.lab1;
                break;
              case CaseId.label2CaseId:
                a=SizeValue.lab2;
                break;
              case CaseId.label2CaseId:
                a=SizeValue.lab2;
                break;
              case CaseId.label3CaseId:
                a=SizeValue.lab3;
                break;
              case CaseId.label4CaseId:
                a=SizeValue.lab4;
                break;
              case CaseId.label5CaseId:
                a=SizeValue.lab5;
                break;
              case CaseId.label6CaseId:
                a=SizeValue.lab6;
                break;
              case CaseId.label7CaseId:
                a=SizeValue.lab7;
                break;

            }
            // a = SizeValue.labels;
            break;
          case CaseId.profileCaseId:
            a = SizeValue.profile;
            break;
          case CaseId.qrCaseId:
            a = SizeValue.qr;
            break;
          case CaseId.logoCaseId:
            a = SizeValue.logo;
            break;
          case CaseId.underLineHeightCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                a=SizeValue.underlineHeight1;
                break;
              case CaseId.label2CaseId:
                a=SizeValue.underlineHeight2;
                break;
              case CaseId.label3CaseId:
                a=SizeValue.underlineHeight3;
                break;

              case CaseId.label4CaseId:
                a=SizeValue.underlineHeight4;
                break;
              case CaseId.label5CaseId:
                a=SizeValue.underlineHeight5;
                break;
              case CaseId.label6CaseId:
                a=SizeValue.underlineHeight6;
                break;
              case CaseId.label7CaseId:
                a=SizeValue.underlineHeight7;
                break;

            }

            break;
            ///seprate width for each case id
          case CaseId.underLineWidthCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                a=SizeValue.underlineWidth1;
                break;
              case CaseId.label2CaseId:
                a=SizeValue.underlineWidth2;
                break;
              case CaseId.label3CaseId:
                a=SizeValue.underlineWidth3;
                break;

              case CaseId.label4CaseId:
                a=SizeValue.underlineWidth4;
                break;
              case CaseId.label5CaseId:
                a=SizeValue.underlineWidth5;
                break;
              case CaseId.label6CaseId:
                a=SizeValue.underlineWidth6;
                break;
              case CaseId.label7CaseId:
                a=SizeValue.underlineWidth7;
                break;

            }
            break;
          case CaseId.organization:
            a = BoxWidth.organization;
            break;
          case CaseId.organizationtextcolor:
            a = SizeValue.organizationText;
            break;
          default:
            break;
        }
        break;

      ///On changed Callback switch
      case Conditions.onchange:
        switch (caseId) {
          case CaseId.textCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                SizeValue.txt1=a;
                break;
              case CaseId.label2CaseId:
                SizeValue.txt2=a;
                break;
              case CaseId.label2CaseId:
                SizeValue.txt2=a;
                break;
              case CaseId.label3CaseId:
                SizeValue.txt3=a;
                break;
              case CaseId.label4CaseId:
                SizeValue.txt4=a;
                break;
              case CaseId.label5CaseId:
                SizeValue.txt5=a;
                break;
              case CaseId.label6CaseId:
                SizeValue.txt6=a;
                break;
              case CaseId.label7CaseId:
                SizeValue.txt7=a;
                break;

            }
            // SizeValue.text = a;
            break;
          case CaseId.labelTextCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                SizeValue.lab1=a;
                break;
              case CaseId.label2CaseId:
                SizeValue.lab2=a;
                break;
              case CaseId.label2CaseId:
                SizeValue.lab2=a;
                break;
              case CaseId.label3CaseId:
                SizeValue.lab3=a;
                break;
              case CaseId.label4CaseId:
                SizeValue.lab4=a;
                break;
              case CaseId.label5CaseId:
                SizeValue.lab5=a;
                break;
              case CaseId.label6CaseId:
                SizeValue.lab6=a;
                break;
              case CaseId.label7CaseId:
                SizeValue.lab7=a;
                break;

            }
            // SizeValue.labels = a;
            break;
          case CaseId.profileCaseId:
            SizeValue.profile = a;
            break;
          case CaseId.qrCaseId:
            SizeValue.qr = a;
            break;
          case CaseId.logoCaseId:
            SizeValue.logo = a;
            break;
          case CaseId.underLineHeightCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                SizeValue.underlineHeight1=a;
                break;
              case CaseId.label2CaseId:
                SizeValue.underlineHeight2=a;
                break;
              case CaseId.label3CaseId:
                SizeValue.underlineHeight3=a;
                break;

              case CaseId.label4CaseId:
                SizeValue.underlineHeight4=a;
                break;
              case CaseId.label5CaseId:
                SizeValue.underlineHeight5=a;
                break;
              case CaseId.label6CaseId:
                SizeValue.underlineHeight6=a;
                break;
              case CaseId.label7CaseId:
                SizeValue.underlineHeight7=a;
                break;

            }
            // SizeValue.underlineWidth = a;
            break;
            ///under line width for each case id
          case CaseId.underLineWidthCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                SizeValue.underlineWidth1=a;
                break;
              case CaseId.label2CaseId:
                SizeValue.underlineWidth2=a;
                break;
              case CaseId.label3CaseId:
                SizeValue.underlineWidth3=a;
                break;

              case CaseId.label4CaseId:
                SizeValue.underlineWidth4=a;
                break;
              case CaseId.label5CaseId:
                SizeValue.underlineWidth5=a;
                break;
              case CaseId.label6CaseId:
                SizeValue.underlineWidth6=a;
                break;
              case CaseId.label7CaseId:
                SizeValue.underlineWidth7=a;
                break;

            }
            break;
          case CaseId.organization:
            BoxWidth.organization = a;
            break;
          case CaseId.organizationtextcolor:
            SizeValue.organizationText = a;
            break;
          default:
            AppDefault.textMinimumSize = 1;
            AppDefault.textMaximumSize = 100;
        }
        break;
    }
    return a;
  }

  static double paddingSliderValue(
      {required caseId,
      returnType = Conditions.value,
      required orientation,
      double onchangeCallbackValue = 1}) {
    double a = onchangeCallbackValue;
    switch (returnType) {

      ///value
      case Conditions.value:
        switch (caseId) {
          case CaseId.profileCaseId:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.profileVertical
                : a = PaddingValue.profileHorizontal;
            break;
          case CaseId.logoCaseId:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.logoVertical
                : a = PaddingValue.logoHorizontal;
            break;
          case CaseId.underLineHeightCaseId:
            a = RadiusValue.underLine;
            break;
          case CaseId.label1CaseId:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.label1Vertical
                : a = PaddingValue.label1Horizontal;
            break;
          case CaseId.label2CaseId:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.label1Vertical
                : a = PaddingValue.label2Horizontal;
            break;
          case CaseId.label3CaseId:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.label3Vertical
                : a = PaddingValue.label3Horizontal;
            break;
          case CaseId.label4CaseId:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.label4Vertical
                : a = PaddingValue.label4Horizontal;
            break;
          case CaseId.label5CaseId:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.label5Vertical
                : a = PaddingValue.label5Horizontal;
            break;
          case CaseId.label6CaseId:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.label6Vertical
                : a = PaddingValue.label6Horizontal;
            break;
          case CaseId.label7CaseId:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.label7Vertical
                : a = PaddingValue.label7Horizontal;
            break;
          case CaseId.organization:
            orientation == PaddingPosition.vertical
                ? a = PaddingValue.organizationNameVertical
                : a = PaddingValue.organizationNameHorizontal;
            break;
        }
        break;

      ///On changed Callback switch
      case Conditions.onchange:
        switch (caseId) {
          case CaseId.profileCaseId:
            orientation == PaddingPosition.vertical
                ? PaddingValue.profileVertical = a
                : PaddingValue.profileHorizontal = a;
            break;

          case CaseId.logoCaseId:
            orientation == PaddingPosition.vertical
                ? PaddingValue.logoVertical = a
                : PaddingValue.logoHorizontal = a;
            print(PaddingValue.logoVertical);
            print(PaddingValue.logoHorizontal);
            break;
          case CaseId.underLineHeightCaseId:
            PaddingValue.underLine = a;
            break;
          case CaseId.label1CaseId:
            orientation == PaddingPosition.vertical
                ? PaddingValue.label1Vertical = a
                : orientation == PaddingPosition.horizontal
                    ? PaddingValue.label1Horizontal = a
                    : AppDefault.defaultSize = a;
            break;
          case CaseId.label2CaseId:
            orientation == PaddingPosition.vertical
                ? PaddingValue.label2Vertical = a
                : PaddingValue.label2Horizontal = a;
            break;
          case CaseId.label3CaseId:
            orientation == PaddingPosition.vertical
                ? PaddingValue.label3Vertical = a
                : PaddingValue.label3Horizontal = a;
            break;
          case CaseId.label4CaseId:
            orientation == PaddingPosition.vertical
                ? PaddingValue.label4Vertical = a
                : PaddingValue.label4Horizontal = a;
            break;
          case CaseId.label5CaseId:
            orientation == PaddingPosition.vertical
                ? PaddingValue.label5Vertical = a
                : PaddingValue.label5Horizontal = a;
            break;
          case CaseId.label6CaseId:
            orientation == PaddingPosition.vertical
                ? PaddingValue.label6Vertical = a
                : PaddingValue.label6Horizontal = a;
            break;
          case CaseId.label7CaseId:
            orientation == PaddingPosition.vertical
                ? PaddingValue.label7Vertical = a
                : PaddingValue.label7Horizontal = a;
            break;
          case CaseId.organization:
            orientation == PaddingPosition.vertical
                ? PaddingValue.organizationNameVertical = a
                : PaddingValue.organizationNameHorizontal = a;
            break;
        }
        break;
    }
    return a;
  }

  static double radiusSliderValue(
      {required caseId,
      returnType = Conditions.value,
      required position,
      double onchangeCallbackValue = 1}) {
    double a = onchangeCallbackValue;
    switch (returnType) {

      ///value
      case Conditions.value:
        switch (caseId) {
          case CaseId.profileCaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.profileTopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.profileTopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.profileBottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.profileBottomRight;
                break;
            }
            break;

          case CaseId.logoCaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.logoTopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.logoTopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.logoBottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.logoBottomRight;
                break;
            }
            break;

          case CaseId.underLineHeightCaseId:
            a = RadiusValue.underLine;
            break;

          case CaseId.label1CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.label1TopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.label1TopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.label1BottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.label1BottomRight;
                break;
            }
            break;

          case CaseId.label2CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.label2TopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.label2TopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.label2BottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.label2BottomRight;
                break;
            }
            break;

          case CaseId.label3CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.label3TopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.label3TopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.label3BottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.label3BottomRight;
                break;
            }
            break;

          case CaseId.label4CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.label4TopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.label4TopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.label4BottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.label4BottomRight;
                break;
            }
            break;

          case CaseId.label5CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.label5TopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.label5TopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.label5BottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.label5BottomRight;
                break;
            }
            break;

          case CaseId.label6CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.label6TopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.label6TopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.label6BottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.label6BottomRight;
                break;
            }
            break;

          case CaseId.label7CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.label7TopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.label7TopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.label7BottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.label7BottomRight;
                break;
            }
            break;
          case CaseId.organization:
            switch (position) {
              case RadiusPosition.topLeft:
                a = RadiusValue.organizationTopLeft;
                break;
              case RadiusPosition.topRight:
                a = RadiusValue.organizationTopRight;
                break;
              case RadiusPosition.bottomLeft:
                a = RadiusValue.organizationBottomLeft;
                break;
              case RadiusPosition.bottomRight:
                a = RadiusValue.organizationBottomRight;
                break;
            }
            break;
        }
        break;

      ///On changed Callback switch
      case Conditions.onchange:
        switch (caseId) {
          case CaseId.profileCaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.profileTopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.profileTopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.profileBottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.profileBottomRight = a;
                break;
            }
            break;

          case CaseId.logoCaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.logoTopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.logoTopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.logoBottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.logoBottomRight = a;
                break;
            }
            break;

          case CaseId.underLineHeightCaseId:
            RadiusValue.underLine = a;
            break;

          case CaseId.label1CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.label1TopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.label1TopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.label1BottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.label1BottomRight = a;
                break;
            }
            break;

          case CaseId.label2CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.label2TopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.label2TopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.label2BottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.label2BottomRight = a;
                break;
            }
            break;

          case CaseId.label3CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.label3TopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.label3TopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.label3BottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.label3BottomRight = a;
                break;
            }
            break;

          case CaseId.label4CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.label4TopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.label4TopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.label4BottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.label4BottomRight = a;
                break;
            }
            break;

          case CaseId.label5CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.label5TopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.label5TopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.label5BottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.label5BottomRight = a;
                break;
            }
            break;

          case CaseId.label6CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.label6TopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.label6TopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.label6BottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.label6BottomRight = a;
                break;
            }
            break;

          case CaseId.label7CaseId:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.label7TopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.label7TopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.label7BottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.label7BottomRight = a;
                break;
            }
            break;
          case CaseId.organization:
            switch (position) {
              case RadiusPosition.topLeft:
                RadiusValue.organizationTopLeft = a;
                break;
              case RadiusPosition.topRight:
                RadiusValue.organizationTopRight = a;
                break;
              case RadiusPosition.bottomLeft:
                RadiusValue.organizationBottomLeft = a;
                break;
              case RadiusPosition.bottomRight:
                RadiusValue.organizationBottomRight = a;
                break;
            }
            break;
        }
        break;
    }
    return a;
  }

  static colorValue(
      {required caseId,
      bool background = false,
      returnType = Conditions.value,
      var onchangeCallbackValue = 0xeefcfcfc}) {
    var a = onchangeCallbackValue;

    switch (returnType) {

      ///Onchange color
      case Conditions.onchange:
        switch (caseId) {
          // case CaseId.organization:
          //   ColorValue.organizationBackground = a;
          //   break;
          //   case CaseId.organizationtextcolor:
          //   ColorValue.organizationText = a;
          //   break;
        ///Text Value colors
          case CaseId.textCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                 ColorValue.txt1=a;
                break;
              case CaseId.label2CaseId:
                 ColorValue.txt2=a;
                break;
              case CaseId.label3CaseId:
                 ColorValue.txt3=a;
                break;

              case CaseId.label4CaseId:
                 ColorValue.txt4=a;
                break;
              case CaseId.label5CaseId:
                 ColorValue.txt5=a;
                break;
              case CaseId.label6CaseId:
                 ColorValue.txt6=a;
                break;
              case CaseId.label7CaseId:
                ColorValue.txt7=a;
                break;

            }
            ColorValue.text = a;
            break;
          case CaseId.organization:
            background == true
                ? ColorValue.organizationBackground = a
                : ColorValue.organizationText = a;
            break;
            ///Label colors
          case CaseId.labelTextCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                 ColorValue.lab1=a;
                break;
              case CaseId.label2CaseId:
                 ColorValue.lab2=a;
                break;
              case CaseId.label3CaseId:
                 ColorValue.lab3=a;
                break;

              case CaseId.label4CaseId:
                 ColorValue.lab4=a;
                break;
              case CaseId.label5CaseId:
                 ColorValue.lab5=a;
                break;
              case CaseId.label6CaseId:
                 ColorValue.lab6=a;
                break;
              case CaseId.label7CaseId:
                ColorValue.lab7=a;
                break;

            }
            ColorValue.label = a;
            break;
          case CaseId.backgroundTransparencyCaseId:
            ColorValue.backgroundTransparency = a;
            break;
          case CaseId.qrCaseId:
            background == true
                ? ColorValue.qrBackground = a
                : ColorValue.qr = a;
            break;
          case CaseId.profileCaseId:
            ColorValue.profileBackground = a;
            break;
          case CaseId.logoCaseId:
            ColorValue.logoBackground = a;
            break;
          case CaseId.underLineWidthCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                ColorValue.underline1=a;
                break;
              case CaseId.label2CaseId:
                ColorValue.underline2=a;
                break;

              case CaseId.label3CaseId:
                ColorValue.underline3=a;
                break;
              case CaseId.label4CaseId:
                ColorValue.underline4=a;
                break;
              case CaseId.label5CaseId:
                ColorValue.underline5=a;
                break;
              case CaseId.label6CaseId:
                ColorValue.underline6=a;
                break;
              case CaseId.label7CaseId:
                ColorValue.underline7=a;
                break;

            }
            ColorValue.underLine = a;
            break;
          case CaseId.textAreaCaseId:
            switch (AppDefault.widgetIdCarrier) {
              case CaseId.label1CaseId:
                background == true
                    ? ColorValue.label1Background = a
                    : ColorValue.text1Background = a;
                break;
              case CaseId.label2CaseId:
                background == true
                    ? ColorValue.label2Background = a
                    : ColorValue.text2Background = a;
                break;
              case CaseId.label3CaseId:
                background == true
                    ? ColorValue.label3Background = a
                    : ColorValue.text3Background = a;
                break;
              case CaseId.label4CaseId:
                background == true
                    ? ColorValue.label4Background = a
                    : ColorValue.text4Background = a;
                break;
              case CaseId.label5CaseId:
                background == true
                    ? ColorValue.label5Background = a
                    : ColorValue.text5Background = a;
                break;
              case CaseId.label6CaseId:
                background == true
                    ? ColorValue.label6Background = a
                    : ColorValue.text6Background = a;
                break;
              case CaseId.label7CaseId:
                background == true
                    ? ColorValue.label5Background = a
                    : ColorValue.text7Background = a;
                break;
            }
            break;
        }
        break;

      ///Value colors
      case Conditions.value:
        switch (caseId){
        ///when we click on text area on a card customizer show us buttons "Text color button" will access this case
        ///provide separate color for each value
          case CaseId.textCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                a = ColorValue.txt1;
                break;
              case CaseId.label2CaseId:
                a = ColorValue.txt2;
                break;
              case CaseId.label3CaseId:
                a = ColorValue.txt3;
                break;
              // case CaseId.label3CaseId:
              //   a = ColorValue.txt3;
              //   break;
              case CaseId.label4CaseId:
                a = ColorValue.txt4;
                break;
              case CaseId.label5CaseId:
                a = ColorValue.txt5;
                break;
              case CaseId.label6CaseId:
                a = ColorValue.txt6;
                break;
              case CaseId.label7CaseId:
                a = ColorValue.txt7;
                break;

            }
            a = ColorValue.text;
            break;
          case CaseId.organization:
            background == false
                ? a = ColorValue.organizationText
                : a = ColorValue.organizationBackground;
            break;
          case CaseId.organization:
            a = ColorValue.organizationBackground;
            break;
          case CaseId.organizationtextcolor:
            a = ColorValue.organizationText;
            break;
            ///when we click on text area on a card customizer show us buttons "label color button" will access this case
        ///provide separate color for each label
          case CaseId.labelTextCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                a = ColorValue.lab1;
                break;
              case CaseId.label2CaseId:
                a = ColorValue.lab2;
                break;
              case CaseId.label3CaseId:
                a = ColorValue.lab3;
                break;
              // case CaseId.label3CaseId:
              //   a = ColorValue.lab3;
              //   break;
              case CaseId.label4CaseId:
                a = ColorValue.lab4;
                break;
              case CaseId.label5CaseId:
                a = ColorValue.lab5;
                break;
              case CaseId.label6CaseId:
                a = ColorValue.lab6;
                break;
              case CaseId.label7CaseId:
                a = ColorValue.lab7;
                break;

            }
            a = ColorValue.label;
            break;
          case CaseId.backgroundTransparencyCaseId:
            a = ColorValue.backgroundTransparency;
            break;
          case CaseId.qrCaseId:
            background == true
                ? a = ColorValue.qrBackground
                : a = ColorValue.qr;
            break;
          case CaseId.profileCaseId:
            a = ColorValue.profileBackground;
            break;
          case CaseId.logoCaseId:
            a = ColorValue.logoBackground;
            break;
            ///Separate color for each CaseID
          case CaseId.underLineWidthCaseId:
            switch(AppDefault.widgetIdCarrier){
              case CaseId.label1CaseId:
                a = ColorValue.underline1;
                break;
              case CaseId.label2CaseId:
                a = ColorValue.underline2;
                break;
              case CaseId.label3CaseId:
                a = ColorValue.underline3;
                break;

              case CaseId.label4CaseId:
                a = ColorValue.underline4;
                break;
              case CaseId.label5CaseId:
                a = ColorValue.underline5;
                break;
              case CaseId.label6CaseId:
                a = ColorValue.underline6;
                break;
              case CaseId.label7CaseId:
                a = ColorValue.underline7;
                break;

            }
            // a = ColorValue.underLine;
            break;
          case CaseId.textAreaCaseId:
            switch (AppDefault.widgetIdCarrier) {
              case CaseId.label1CaseId:
                background == false
                    ? a = ColorValue.label1Background
                    : a = ColorValue.text1Background;
                break;
              case CaseId.label2CaseId:
                background == false
                    ? a = ColorValue.label2Background
                    : a = ColorValue.text2Background;
                break;
              case CaseId.label3CaseId:
                background == false
                    ? a = ColorValue.label3Background
                    : a = ColorValue.text3Background;
                break;
              case CaseId.label4CaseId:
                background == false
                    ? a = ColorValue.label4Background
                    : a = ColorValue.text4Background;
                break;
              case CaseId.label5CaseId:
                background == false
                    ? a = ColorValue.label5Background
                    : a = ColorValue.text5Background;
                break;
              case CaseId.label6CaseId:
                background == false
                    ? a = ColorValue.label6Background
                    : a = ColorValue.text6Background;
                break;
              case CaseId.label7CaseId:
                background == false
                    ? a = ColorValue.label5Background
                    : a = ColorValue.text7Background;
                break;
            }

            break;
        }

        break;
    }

    return a;
  }

  static double verticalMovementValue(
      {required caseId, required onchangeCallbackValue}) {
    double _defSeekVal = 1;
    AppDefault.defaultVertVal = onchangeCallbackValue;
    switch (caseId) {
      case 'profileCaseId':
        VerticalSlider.profile = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.profile * 1.68;

        Dy.profile = _defSeekVal > 168 - SizeValue.profile
            ? _defSeekVal = 168 - SizeValue.profile
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;

        break;
      case 'qrCaseId':
        VerticalSlider.qr = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.qr * 1.68;
        Dy.qr = _defSeekVal > 168 - SizeValue.qr
            ? _defSeekVal = 168 - SizeValue.qr
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;

        break;
      case 'logoCaseId':
        VerticalSlider.logo = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.logo * 1.68;
        Dy.logo = _defSeekVal > 168 - SizeValue.logo
            ? _defSeekVal = 168 - SizeValue.logo
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        AppDefault.defaultVertVal = onchangeCallbackValue;
        break;
      // case 'underLineCaseId':
      //   VerticalSlider.underLine = onchangeCallbackValue;
      //   _defSeekVal = VerticalSlider.underLine * 1.68;
      //   Vertical.underLine = _defSeekVal > 168 - SizeValue.underlineWidth
      //       ? _defSeekVal = 168 - SizeValue.underlineWidth
      //       : _defSeekVal < 0
      //           ? _defSeekVal = 0
      //           : _defSeekVal;
      //   AppDefault.defaultVertVal = onchangeCallbackValue;
      //   break;

      case 'label1CaseId':
        VerticalSlider.lv1 = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.lv1 * 1.68;
        Dy.label1 = _defSeekVal > 168 - SizeValue.labels
            ? _defSeekVal = 168 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label2CaseId':
        VerticalSlider.lv2 = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.lv2 * 1.68;
        Dy.label2 = _defSeekVal > 168 - SizeValue.labels
            ? _defSeekVal = 168 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label3CaseId':
        VerticalSlider.lv3 = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.lv3 * 1.68;
        Dy.label3 = _defSeekVal > 168 - SizeValue.labels
            ? _defSeekVal = 168 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label4CaseId':
        VerticalSlider.lv4 = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.lv4 * 1.68;
        Dy.label4 = _defSeekVal > 168 - SizeValue.labels
            ? _defSeekVal = 168 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label5CaseId':
        VerticalSlider.lv5 = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.lv5 * 1.68;
        Dy.label5 = _defSeekVal > 168 - SizeValue.labels
            ? _defSeekVal = 168 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label6CaseId':
        VerticalSlider.lv6 = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.lv6 * 1.68;
        Dy.label6 = _defSeekVal > 168 - SizeValue.labels
            ? _defSeekVal = 168 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;

        break;
      case 'label7CaseId':
        VerticalSlider.lv7 = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.lv7 * 1.68;
        Dy.label7 = _defSeekVal > 168 - SizeValue.labels
            ? _defSeekVal = 168 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case CaseId.organization:
        VerticalSlider.organization = onchangeCallbackValue;
        _defSeekVal = VerticalSlider.organization * 1.68;
        Dy.organization = _defSeekVal > 168 - BoxHeight.organization
            ? _defSeekVal = 168 - BoxHeight.organization
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
    }
    return AppDefault.defaultVertVal;
  }

  static double horizontalMovementValue(
      {required caseId, required onchangeCallbackValue}) {
    double _defSeekVal = 1;
    AppDefault.defaultHorVal = onchangeCallbackValue;
    switch (caseId) {
      case 'profileCaseId':
        HorizontalSlider.profile = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.profile * 2.72;
        Dx.profile = _defSeekVal > 272 - SizeValue.profile
            ? _defSeekVal = 272 - SizeValue.profile
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        AppDefault.defaultHorVal = onchangeCallbackValue;

        break;
      case 'qrCaseId':
        HorizontalSlider.qr = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.qr * 2.72;
        Dx.qr = _defSeekVal > 272 - SizeValue.qr
            ? _defSeekVal = 272 - SizeValue.qr
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        AppDefault.defaultHorVal = onchangeCallbackValue;
        break;
      case 'logoCaseId':
        HorizontalSlider.logo = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.logo * 2.72;
        Dx.logo = _defSeekVal > 272 - SizeValue.logo
            ? _defSeekVal = 272 - SizeValue.logo
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        AppDefault.defaultHorVal = onchangeCallbackValue;
        break;
      // case 'underLineCaseId':
      //   HorizontalSlider.underLine = onchangeCallbackValue;
      //   _defSeekVal = HorizontalSlider.underLine * 2.72;
      //   Horizontal.underLine = _defSeekVal > 272 - SizeValue.underlineWidth
      //       ? _defSeekVal = 272 - SizeValue.underlineWidth
      //       : _defSeekVal < 0
      //           ? _defSeekVal = 0
      //           : _defSeekVal;
      //   AppDefault.defaultHorVal = onchangeCallbackValue;
      //   break;
      case 'label1CaseId':
        HorizontalSlider.lv1 = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.lv1 * 2.72;
        Dx.label1 = _defSeekVal > 272 - SizeValue.labels
            ? _defSeekVal = 272 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label2CaseId':
        HorizontalSlider.lv2 = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.lv2 * 2.72;
        Dx.label2 = _defSeekVal > 272 - SizeValue.labels
            ? _defSeekVal = 272 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label3CaseId':
        HorizontalSlider.lv3 = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.lv3 * 2.72;
        Dx.label3 = _defSeekVal > 272 - SizeValue.labels
            ? _defSeekVal = 272 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label4CaseId':
        HorizontalSlider.lv4 = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.lv4 * 2.72;
        Dx.label4 = _defSeekVal > 272 - SizeValue.labels
            ? _defSeekVal = 272 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label5CaseId':
        HorizontalSlider.lv5 = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.lv5 * 2.72;
        Dx.label5 = _defSeekVal > 272 - SizeValue.labels
            ? _defSeekVal = 272 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case 'label6CaseId':
        HorizontalSlider.lv6 = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.lv6 * 2.72;
        Dx.label6 = _defSeekVal > 272 - SizeValue.labels
            ? _defSeekVal = 272 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;

        break;
      case 'label7CaseId':
        HorizontalSlider.lv7 = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.lv7 * 2.72;
        Dx.label7 = _defSeekVal > 272 - SizeValue.labels
            ? _defSeekVal = 272 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
      case CaseId.organization:
        HorizontalSlider.organization = onchangeCallbackValue;
        _defSeekVal = HorizontalSlider.organization * 2.72;
        Dx.organization = _defSeekVal > 272 - BoxWidth.organization
            ? _defSeekVal = 272 - SizeValue.labels
            : _defSeekVal < 0
                ? _defSeekVal = 0
                : _defSeekVal;
        break;
    }
    return AppDefault.defaultHorVal;
  }



  static cardFontsValues({val, caseId, bool onchangeCallbackValue = true}) {
    if (onchangeCallbackValue) {
      switch (caseId) {
        case CaseId.textCaseId:
          switch(AppDefault.widgetIdCarrier){
            case CaseId.label1CaseId:
              FontsValue.lab1=val;
              break;
            case CaseId.label2CaseId:
              FontsValue.lab2=val;
              break;
            case CaseId.label3CaseId:
              FontsValue.lab3=val;
              break;
            case CaseId.label4CaseId:
              FontsValue.lab4=val;
              break;
            case CaseId.label5CaseId:
              FontsValue.lab5=val;
              break;
            case CaseId.label6CaseId:
              FontsValue.lab6=val;
              break;
            case CaseId.label7CaseId:
              FontsValue.lab7=val;
              break;

          }
          FontsValue.text = val;
          break;
        case CaseId.labelTextCaseId:
          switch(AppDefault.widgetIdCarrier){
            case CaseId.label1CaseId:
              FontsValue.txt1=val;
              break;
            case CaseId.label2CaseId:
              FontsValue.txt2=val;
              break;
            case CaseId.label3CaseId:
              FontsValue.txt3=val;
              break;
            case CaseId.label4CaseId:
              FontsValue.txt4=val;
              break;
            case CaseId.label5CaseId:
              FontsValue.txt5=val;
              break;
            case CaseId.label6CaseId:
              FontsValue.txt6=val;
              break;
            case CaseId.label7CaseId:
              FontsValue.txt7=val;
              break;

          }
          FontsValue.label = val;
          break;

        ///
        case CaseId.organization:
          FontsValue.organizationName = val;
          break;

      }
    } else {
      switch (caseId) {
        case CaseId.textCaseId:
          switch(AppDefault.widgetIdCarrier){
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
          FontsValue.text = val;
          break;
        case CaseId.labelTextCaseId:
          switch(AppDefault.widgetIdCarrier){
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
          break;
        case CaseId.organization:
          return FontsValue.organizationName;
      }
    }
  }
  static cardTextBoxDesign({val, bool onchangeCallbackValue = true}) {
    if (onchangeCallbackValue) {
      switch(AppDefault.widgetIdCarrier){
        case CaseId.label1CaseId:
          TextBoxDesign.lv1=val;
          break;
        case CaseId.label2CaseId:
          TextBoxDesign.lv2=val;
          break;
        case CaseId.label3CaseId:
          TextBoxDesign.lv3=val;
          break;
        case CaseId.label4CaseId:
          TextBoxDesign.lv4=val;
          break;
        case CaseId.label5CaseId:
          TextBoxDesign.lv5=val;
          break;
        case CaseId.label6CaseId:
          TextBoxDesign.lv6=val;
          break;
        case CaseId.label7CaseId:
          TextBoxDesign.lv7=val;
          break;

      }

    } else {
      switch(AppDefault.widgetIdCarrier){
        case CaseId.label1CaseId:
          return TextBoxDesign.lv1;

        case CaseId.label2CaseId:
          return TextBoxDesign.lv2;

        case CaseId.label3CaseId:
          return TextBoxDesign.lv3;

        case CaseId.label4CaseId:
          return TextBoxDesign.lv4;

        case CaseId.label5CaseId:
          return TextBoxDesign.lv5;

        case CaseId.label6CaseId:
          return TextBoxDesign.lv6;

        case CaseId.label7CaseId:
          return TextBoxDesign.lv7;


      }}
  }
}
