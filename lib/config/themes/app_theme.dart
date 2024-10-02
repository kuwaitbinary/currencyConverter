import 'package:code_challenge/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.hintColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.homePageDefaultBackGround,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.homePageAppBarBackGround,
        titleTextStyle: TextStyle(
          color: AppColors.homePageAppBarText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
  );
}
