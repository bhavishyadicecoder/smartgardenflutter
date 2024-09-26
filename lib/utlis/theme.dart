import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        // fontFamily: 'ProximaNovaAlt',
        scaffoldBackgroundColor: bgColor,
      );

// FontFamily

  static String proximaNovaAltfontFamily = 'ProximaNovaAlt';
  static String noeDispalyfontFamily = 'NoeDisplay';

// Color
  static Color bgColor = Colors.white;
  static Color themeGreenBgColor = const Color(0xFF0eaa68);
  static Color iconColor = const Color(0xFF3BCEAC);
  static Color green_50 = const Color(0xFF06492C);
  static Color green_20 = const Color(0xFF0C9359);
  static Color green_10 = const Color(0xFF0EAD69);
  static Color lightGrenish = const Color(0xFFeefaf6);
  static Color grey_50 = const Color(0xFFAAABAA);
  // static Color grey_50 = const Color(0xFF555555);
}
