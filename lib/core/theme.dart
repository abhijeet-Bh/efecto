import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  //color pallet
  static const Color primaryColor = Color(0xff0A2647);
  static const Color secondaryColor = Color(0xff144272);
  static const Color secondaryLightColor = Color(0xff2C74B3);
  static const Color primaryLightColor = Color(0xffCFE7FD);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff363435);

  static const Color blueLightColor = Color(0xffE7E5FF);

  // App Theme Constants
  static const EdgeInsetsGeometry pagePadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 12,
  );

  //Text Style
  //Headings
  static const TextStyle primaryHeadingTextLarge = TextStyle(
    fontSize: 26,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle primaryHeadingTextMedium = TextStyle(
    fontSize: 18,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle primaryHeadingTextSmall = TextStyle(
    fontSize: 16,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  );

  //Body
  static const TextStyle primaryBodyTextLarge = TextStyle(
    fontSize: 16,
    color: primaryColor,
  );
  static const TextStyle primaryBodyTextMedium = TextStyle(
    fontSize: 14,
    color: primaryColor,
  );
  static const TextStyle primaryBodyTextSmall = TextStyle(
    fontSize: 12,
    color: primaryColor,
  );

  //Text Theme
  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: primaryHeadingTextMedium,
    bodyLarge: primaryBodyTextMedium,
  );

  //Themes
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      color: whiteColor,
      iconTheme: IconThemeData(color: primaryColor),
    ),
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      onPrimary: primaryLightColor,
      secondary: secondaryColor,
      primaryContainer: primaryLightColor,
    ),
    textTheme: _lightTextTheme,
    bottomAppBarTheme: const BottomAppBarTheme(color: primaryColor),
  );
}
