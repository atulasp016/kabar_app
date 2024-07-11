import 'package:flutter/material.dart';
import 'package:kabar_app/domain/utils/app_colors.dart';

class AppThemeData {
  ///light
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white_Color,
    colorScheme: const ColorScheme.light(),
    brightness: Brightness.light);

  ///dark
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black12,
      colorScheme: const ColorScheme.dark(),
      brightness: Brightness.dark);
}
