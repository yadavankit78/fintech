
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:neu_byte_digital/constant/constant.dart';

class AppTheme {

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light ,
    fontFamily: 'NotoSans',
    useMaterial3: true ,
    textTheme:  const TextTheme(
      headlineLarge: TextStyle(color: AppColor.blackColor , fontSize: 20 , fontWeight: FontWeight.w500),
      headlineMedium: TextStyle(color: AppColor.blackColor , fontSize: 18 , fontWeight: FontWeight.w400),

      bodyLarge: TextStyle(color:AppColor.blackColor , fontSize: 16 , fontWeight: FontWeight.w400 ),
      bodyMedium: TextStyle(color:AppColor.blackColor80 , fontSize: 14 , fontWeight: FontWeight.w400 ),
      bodySmall: TextStyle(color: AppColor.blackColor , fontSize: 12 , fontWeight: FontWeight.w400),
    ) ,
    appBarTheme: const AppBarTheme(
      foregroundColor: AppColor.blackColor ,
      backgroundColor: AppColor.whiteColor ,
    ),

    elevatedButtonTheme: const ElevatedButtonThemeData(
       style: ButtonStyle(
         backgroundColor: WidgetStatePropertyAll(AppColor.primaryColor ),
         foregroundColor: WidgetStatePropertyAll(AppColor.whiteColor ),
         minimumSize: WidgetStatePropertyAll(Size.fromHeight(60)),
         maximumSize: WidgetStatePropertyAll(Size.infinite),
         shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))

       ),
    ),

    inputDecorationTheme: const InputDecorationTheme(

      disabledBorder: OutlineInputBorder(

        borderSide: BorderSide() ,
        borderRadius: BorderRadius.all(Radius.circular(8))),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.primaryColor ,
        ) ,
        borderRadius: BorderRadius.all(Radius.circular(8)),


      ) ,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      fillColor: AppColor.whileColor40 ,


    ) ,

    datePickerTheme: const DatePickerThemeData(
      backgroundColor:AppColor.whiteColor,
      dividerColor: AppColor.greyColorText ,
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColor.primaryColor),
      ),
      cancelButtonStyle:ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColor.primaryColor),
      ),
    )
  );

}