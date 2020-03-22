import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static final TextStyle cityName = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
    ),
  );

  static final TextStyle temperature = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 64,
    ),
  );

  static final TextStyle weatherMain = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  );

  static final TextStyle description = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
  );

  static final TextStyle button = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
  );

  static final TextStyle information = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
  );
}
