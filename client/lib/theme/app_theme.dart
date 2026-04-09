import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFF3B5BDB);
  static const Color secondary = Color(0xFF59C2FF);
  static const Color accent = Color(0xFF40B57A);
  static const Color background = Color(0xFFF4F7FF);
  static const Color surface = Colors.white;
  static const double borderRadius = 20;

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    secondary: secondary,
    brightness: Brightness.light,
    surface: surface,
  );

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: background,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.grey.shade900,
      iconTheme: const IconThemeData(color: Colors.black87),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(Typography.blackMountainView).apply(
      bodyColor: Colors.grey.shade900,
      displayColor: Colors.grey.shade900,
    ),
    cardTheme: CardThemeData(
      color: surface,
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Colors.grey.shade500),
      labelStyle: TextStyle(color: Colors.grey.shade700),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surface,
      selectedItemColor: primary,
      unselectedItemColor: Colors.grey.shade600,
      elevation: 12,
    ),
  );

  static BoxDecoration cardDecoration({Color? color}) => BoxDecoration(
    color: color ?? surface,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(20),
        blurRadius: 18,
        offset: const Offset(0, 10),
      ),
    ],
  );
}
