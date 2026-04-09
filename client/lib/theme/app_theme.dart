import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFF000666);
  static const Color primaryContainer = Color(0xFF1A237E);
  static const Color secondary = Color(0xFF585C80);
  static const Color secondaryContainer = Color(0xFFD2D4FF);
  static const Color tertiary = Color(0xFF400001);
  static const Color tertiaryContainer = Color(0xFF680004);
  static const Color background = Color(0xFFFBF8FF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceContainer = Color(0xFFEFECF5);
  static const Color surfaceContainerLow = Color(0xFFF5F2FB);
  static const Color surfaceContainerHigh = Color(0xFFEAE7EF);
  static const Color onSurface = Color(0xFF1B1B21);
  static const Color onBackground = Color(0xFF1B1B21);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color outline = Color(0xFF767683);
  static const Color error = Color(0xFFBA1A1A);
  static const double borderRadius = 24.0;

  static final ColorScheme lightColorScheme =
      ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
      ).copyWith(
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimary,
        secondary: secondary,
        onSecondary: onPrimary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: primary,
        tertiary: tertiary,
        onTertiary: onPrimary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onPrimary,
        surface: surface,
        onSurface: onSurface,
        surfaceContainer: surfaceContainer,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainerHigh: surfaceContainerHigh,
        surfaceContainerHighest: surfaceContainer,
        outline: outline,
        shadow: Colors.black12,
        error: error,
        onError: Colors.white,
        inverseSurface: surfaceContainerHigh,
        onInverseSurface: onSurface,
        inversePrimary: const Color(0xFFBDC2FF),
      );

  static ThemeData get lightTheme {
    final manrope = GoogleFonts.manropeTextTheme(ThemeData.light().textTheme);
    final inter = GoogleFonts.interTextTheme(ThemeData.light().textTheme);
    final textTheme = manrope.copyWith(
      bodyLarge: inter.bodyLarge,
      bodyMedium: inter.bodyMedium,
      bodySmall: inter.bodySmall,
      labelLarge: inter.labelLarge,
      labelSmall: inter.labelSmall,
      titleSmall: inter.titleSmall,
      titleMedium: inter.titleMedium,
      titleLarge: inter.titleLarge,
    );

    final base = ThemeData.from(
      colorScheme: lightColorScheme,
      textTheme: textTheme,
      useMaterial3: true,
    );

    return base.copyWith(
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: background,
        foregroundColor: primary,
        iconTheme: const IconThemeData(color: primary),
        titleTextStyle: GoogleFonts.manrope(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: primary,
        ),
      ),
      textTheme: textTheme.apply(bodyColor: onSurface, displayColor: onSurface),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceContainerLow,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: outline),
        labelStyle: TextStyle(color: onSurface.withAlpha(179)),
      ),
      iconTheme: const IconThemeData(color: primary),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: outline,
        elevation: 10,
      ),
      dividerTheme: DividerThemeData(color: outline.withAlpha(51)),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceContainerLow,
        disabledColor: surfaceContainerLow,
        selectedColor: primaryContainer,
        secondarySelectedColor: primaryContainer,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: onSurface,
        ),
        secondaryLabelStyle: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: onPrimary,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }

  static BoxDecoration cardDecoration({Color? color}) => BoxDecoration(
    color: color ?? surface,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(20),
        blurRadius: 24,
        offset: const Offset(0, 14),
      ),
    ],
  );
}
