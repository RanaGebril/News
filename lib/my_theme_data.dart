import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'APPColors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        color: AppColors.primary,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35))),
        titleTextStyle: GoogleFonts.exo(
            color: AppColors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400),
        iconTheme: IconThemeData(
            color: AppColors.white,
            size: 30)),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.exo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
        bodyMedium: GoogleFonts.exo(
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: GoogleFonts.exo(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        )
    )

  );
}
