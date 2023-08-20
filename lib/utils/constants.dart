
import 'package:flutter/material.dart';

class NewAppConst {
  static const lightGreen = Color(0xff1fdf9c);
  static const lightBlue = Color(0xff269ed1);
  static const darkOrange = Color(0xfff36d24);
  static const lightOrange = Color(0xfff59050);



  static  Widget customPadding({
    required double left,
    required double top,
    required double right,
    required double bottom,
    required Widget child,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: child,
    );
  }


  static Widget customSizedBox({
    required double width,
    required double height,
  }) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

   static  TextStyle customTextStyle({
  required double customFontSize,
     required FontWeight customFontWeight,
     required String customFontFamily,
     required Color customFontColor


}) {
    return TextStyle(
      fontSize: customFontSize,
      fontWeight: customFontWeight,
      fontFamily: customFontFamily,
      color: customFontColor,
    );
   }

  static Widget customElevatedButton({
  required Widget child,
  required Function runCode
}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: NewAppConst.darkOrange,
          shadowColor: Colors.orange.withOpacity(0.7),
          //make color or elevated button transparent
        ),
        onPressed: (){runCode();}
    , child: child);
}


}