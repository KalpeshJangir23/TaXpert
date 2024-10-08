import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextTheme myTextTheme = TextTheme(
  headlineSmall: GoogleFonts.nunitoSans(
    fontSize: 18,
    color: const Color(0xFFFFFFFF),
  ),
  displayLarge: GoogleFonts.nunitoSans(fontSize: 32, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.bold), // textColor
  displayMedium: GoogleFonts.nunitoSans(fontSize: 24, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.bold), // textColor
  displaySmall: GoogleFonts.nunitoSans(fontSize: 20, color: const Color(0xFFFFFFFF), fontWeight: FontWeight.bold), // textColor
  bodyLarge: GoogleFonts.nunitoSans(fontSize: 16, color: const Color(0xFFFFFFFF)), // textColor
  bodyMedium: GoogleFonts.nunitoSans(fontSize: 14, color: const Color(0xFFFFFFFF)), // textColor
  titleMedium: GoogleFonts.nunitoSans(
    fontSize: 18,
    color: const Color(0xFFFFFFFF), // textColor
  ),

  titleSmall: GoogleFonts.nunitoSans(
    fontSize: 16,
    color: const Color(0xFFFFFFFF), // textColor
  ),
);

ColorScheme myColorScheme = ColorScheme(
    primary: const Color(0xFFFBFF2C), // chartColor
    secondary: const Color(0xFF84B13B), // greenColor
    secondaryContainer: const Color(0xFFE1E1E1), // greyShadow
    surface: const Color(0xff000000), // scaffoldColor // used
    error: Colors.red,
    onPrimary: const Color(0xFFFFFFFF), // textColor
    onSecondary: const Color(0xFFFFFFFF).withOpacity(0.5), // textColor
    onSurface: const Color(0xFFFFFFFF), // used
    onError: const Color(0xFFFFFFFF),
    brightness: Brightness.dark, // set to dark mode for consistency
    outline: const Color(0xFFE1E1E1), // greyShadow
    onTertiary: const Color(0xff252525));
