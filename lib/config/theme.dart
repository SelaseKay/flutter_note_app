import 'package:flutter/material.dart';
import 'package:note_app/constants/app_dimens.dart';

const _baseTextStyle = TextStyle(fontFamily: 'Nunito');

class AppTheme {
  AppTheme._();

  static final theme = ThemeData(
      primaryColor: const Color(0xFF252525),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF252525),
        primary: const Color(0xFF252525),
        errorContainer: const Color(0xFFFF0000),
        secondaryContainer: const Color(0xFF30BE71),
      ),
      fontFamily: 'Nunito',
      useMaterial3: false,
      textTheme: TextTheme(
          displayLarge: _baseTextStyle.copyWith(
            fontSize: AppDimens.displayLarge,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: _baseTextStyle.copyWith(
            fontSize: AppDimens.displayMedium,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: _baseTextStyle.copyWith(
            fontSize: AppDimens.displaySmall,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
          headlineMedium: _baseTextStyle.copyWith(
            fontSize: AppDimens.headlineMedium,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          )));
}
