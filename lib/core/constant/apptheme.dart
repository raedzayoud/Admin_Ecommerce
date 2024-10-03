
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.primaycolor, // App bar background color
    elevation: 0,
    titleTextStyle: TextStyle(color: AppColor.white,fontSize: 23),
    centerTitle: true,
    iconTheme: IconThemeData( // Controls the color of the back arrow
      color: AppColor.white, // White color for the back arrow
    ),
    
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w500, 
      fontSize: 20, 
      color: AppColor.black
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w500, 
      fontSize: 25, 
      color: AppColor.black
    ),
    bodyLarge: TextStyle(
      height: 2, 
      color: AppColor.grey
    ),
  ),
);
