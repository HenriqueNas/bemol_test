import 'package:bemol_test/app/view/theme/bemol_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(),
  appBarTheme: appBar,
  inputDecorationTheme: inputDecoration,
);

final appBar = AppBarTheme(
  centerTitle: false,
  elevation: 0,
  backgroundColor: BemolColors.background,
  foregroundColor: BemolColors.onBackground,
  titleTextStyle: TextStyle(
    color: BemolColors.onBackground,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.poppins().fontFamily,
  ),
  iconTheme: const IconThemeData(
    color: BemolColors.onBackground,
  ),
);

final inputDecoration = InputDecorationTheme(
  filled: true,
  fillColor: BemolColors.surface,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
  ),
  hintStyle: TextStyle(
    color: BemolColors.onSurface.withOpacity(0.72),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16, // Same of 24px
    fontFamily: GoogleFonts.poppins().fontFamily,
  ),
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  ),
);

extension TextStyleHelpers on TextStyle {
  TextStyle? get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle? get ratingStyle => bold?.copyWith(
        color: BemolColors.onSurface.withOpacity(0.72),
      );
}
