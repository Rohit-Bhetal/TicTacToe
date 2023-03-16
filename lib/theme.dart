import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      textTheme: TextTheme(
          titleSmall: GoogleFonts.raleway(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
          titleLarge: GoogleFonts.raleway(
              fontSize: 100,
              fontWeight: FontWeight.w200,
              color: Colors.white)));

  static ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      textTheme: TextTheme(
          titleSmall: GoogleFonts.raleway(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
          titleLarge: GoogleFonts.raleway(
              fontSize: 100,
              fontWeight: FontWeight.w200,
              color: Colors.black)));
}
