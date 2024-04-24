import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final theme = ThemeData(
  useMaterial3: false,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(17, 17, 17, 1),
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(17, 17, 17, 1),
  brightness: Brightness.dark,
  primaryColor: const Color.fromRGBO(116, 14, 178, 1),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: const Color.fromRGBO(250, 250, 250, 0.4),
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      inherit: false,
    ),
    bodySmall: TextStyle(
      color: const Color.fromRGBO(250, 250, 250, 0.4),
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      inherit: false,
    ),
  ),
);
