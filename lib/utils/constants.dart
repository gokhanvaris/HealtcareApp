import 'dart:ffi';

import 'package:flutter/material.dart';

class KConstant {
  static const Color appBarColor = Color(0xfffcfbff);
  static const kHomePadding = 10.0;
  static TextStyle kTextStyle(
          FontWeight fontWeight, Color color, double fontSize) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
}
