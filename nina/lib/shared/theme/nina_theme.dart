import 'package:flutter/material.dart';

/// Design tokens for the Nina app.
class NinaColors {
  NinaColors._();

  // Primary
  static const Color primary = Color(0xFFDAA520);

  // Backgrounds
  static const Color backgroundMain = Color(0xFFFFF8F0);
  static const Color backgroundSecondary = Color(0xFFFFFDE7);

  // Feedback
  static const Color success = Color(0xFF66BB6A);
  static const Color tryAgain = Color(0xFFFFA726);

  // Text
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);

  // UI elements
  static const Color cta = Color(0xFFFF7043);
  static const Color tracks = Color(0xFF8D6E63);
  static const Color sky = Color(0xFF81D4FA);
  static const Color grass = Color(0xFFA5D6A7);

  // Wagons
  static const Color wagonLetters = Color(0xFFEF5350);
  static const Color wagonNumbers = Color(0xFF42A5F5);
  static const Color wagonRewards = Color(0xFFAB47BC);
}

class NinaTheme {
  NinaTheme._();

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: NinaColors.backgroundMain,
      colorScheme: ColorScheme.fromSeed(
        seedColor: NinaColors.primary,
        primary: NinaColors.primary,
        surface: NinaColors.backgroundMain,
      ),
      fontFamily: 'Nunito',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: NinaColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: NinaColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: NinaColors.textPrimary,
          fontFamily: 'Quicksand',
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: NinaColors.textPrimary,
          fontFamily: 'Quicksand',
        ),
        labelLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NinaColors.cta,
          foregroundColor: Colors.white,
          minimumSize: const Size(200, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    );
  }
}
