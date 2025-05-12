import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pretium/utils/size_config.dart';

class AppStyles {
  static final headingTextStyle = TextStyle(
    fontSize: SizeConfig.getProportionateHeight(20),
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static final titleTextStyle = TextStyle(
    fontSize: SizeConfig.getProportionateHeight(18),
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final normalTextStyle = TextStyle(
    fontSize: SizeConfig.getProportionateHeight(15),
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static const mainColor = Color(0xFF14645f);
}
