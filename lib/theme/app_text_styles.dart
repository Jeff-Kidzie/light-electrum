import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lightweight_electrum/theme/app_color.dart';

class AppTextStyles {
  static TextStyle heading1 = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle heading2 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  // Body
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Color(0xFF555555),
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color(0xFF555555),
  );

  // Labels
  static TextStyle label = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // Buttons
  static TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bold = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: Color(0xFF1A1A1A),
  );

  static TextStyle semiBold = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
    color: Color(0xFF1A1A1A),
  );

  static TextStyle priceStyleBig = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Color(AppColors.primary),
  );

  static TextStyle regular = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF555555),
  );

  static TextStyle title = semiBold.copyWith(fontSize: 18, color: Colors.black);

  AppTextStyles._();
}
