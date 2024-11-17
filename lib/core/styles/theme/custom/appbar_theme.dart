import 'package:capes_for_you/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class LAppBarTheme {
  LAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.white,
  );
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.black,
    foregroundColor: AppColors.black,
  );
}
