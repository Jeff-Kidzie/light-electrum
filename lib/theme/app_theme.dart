import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final textTheme = ThemeData.light().textTheme;

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF2B6EF1),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      fontFamily: GoogleFonts.inter().fontFamily,
      textTheme: GoogleFonts.interTextTheme(textTheme).copyWith(
        bodyMedium: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
