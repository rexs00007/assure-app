import 'package:flutter/material.dart';

class AppConst {
  static const double padding = 15.0;
  static const double paddings = 5.0;
  static const double radius = 12.0;
  static const EdgeInsets paddingAll = EdgeInsets.all(padding);
  static const EdgeInsets paddingLTR = EdgeInsets.fromLTRB(padding, padding, padding, 0);
  static const EdgeInsets customPadding = EdgeInsets.fromLTRB(padding, padding, padding, 0);
  static const Widget paddingWxl = SizedBox(width: 20,);
  static const Widget paddingHxl = SizedBox(height: 20,);
  static const Widget paddingW = SizedBox(width: padding,);
  static const Widget paddingH = SizedBox(height: padding,);
  static const Widget paddingWs = SizedBox(width: paddings,);
  static const Widget paddingHs = SizedBox(height: paddings,);
  static BorderRadius borderRadius = BorderRadius.circular(radius);
  static const ScrollPhysics scrollPhysics = BouncingScrollPhysics();

  static const Divider divider = Divider(color: lightGray,thickness: 10,);

  static const BorderRadius borderRadiusTopOnly = BorderRadius.only(
    topLeft: Radius.circular(AppConst.radius),
    topRight: Radius.circular(AppConst.radius),
  );

  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Cubic curves = Curves.easeInOut;

  static const BoxShadow boxShadow =
  BoxShadow(color: Colors.black12, blurRadius: 16, offset: Offset(4, 8));

  static const TextStyle t1 = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500
  );

  static const TextStyle xt = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold
  );

  static const TextStyle customTextStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold
  );

  ////////////////////////////////////////////////////Theme
  static const appViolet = Color(0xff6C78E6);
  static const appAccent = Color(0xff40DDB6);

  static const lightGray = Color(0xffF4F4F4);
  static const gray = Color(0xffcccccc);
  static const darkGray = Colors.grey;

  static const lightBackgroundColour = Color(0xffFDFDFD);
  static const darkBackgroundColour = Color(0xff0B0B0B);

  static const glassColour = Color(0x07777777);
  static const black = Color(0xff212121);
  static const shadowColor = Colors.black26;
  static const splashColor = Color(0xff40DDB6);
  static const hoverColor = Color(0x3d2aa9e0);

  static const errorColor = Color(0xffff3c3c);

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightBackgroundColour,
    primaryColorDark: appViolet,
    canvasColor: lightBackgroundColour,
    scaffoldBackgroundColor: lightBackgroundColour,
    splashColor: splashColor,
    hoverColor: hoverColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: appAccent,
      selectionColor: hoverColor,
      selectionHandleColor: hoverColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
      bodySmall: TextStyle(),
    ).apply(
      bodyColor: darkBackgroundColour,
      fontFamily: 'Poppins',
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: lightBackgroundColour,
        titleTextStyle: TextStyle(
          color: appViolet,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: darkBackgroundColour, size: 24),
        shadowColor: shadowColor
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: appAccent),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: lightBackgroundColour,
    canvasColor: darkBackgroundColour,
    scaffoldBackgroundColor: darkBackgroundColour,
    splashColor: splashColor,
    hoverColor: hoverColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: appAccent,
      selectionColor: hoverColor,
      selectionHandleColor: hoverColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
      bodySmall: TextStyle(),
    ).apply(
      bodyColor: lightBackgroundColour,
      fontFamily: 'Poppins',
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackgroundColour,
      titleTextStyle: TextStyle(
          color: lightBackgroundColour,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: lightBackgroundColour, size: 24),
      shadowColor: shadowColor,
    ),
    tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Colors.grey,
        labelColor: lightBackgroundColour,
        dividerColor: lightBackgroundColour,
        labelStyle: TextStyle(
            color: lightBackgroundColour
        )
    ),
    floatingActionButtonTheme:
    const FloatingActionButtonThemeData(backgroundColor: appAccent),
  );
}
