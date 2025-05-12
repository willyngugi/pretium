import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double screenHeight = 0.0;
  static double screenWidth = 0.0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static double getProportionateHeight(double inputHeight) {
    return (inputHeight / 812) * screenHeight;
  }

  static double getProportionateWidth(double inputWidth) {
    return (inputWidth / 375) * screenWidth;
  }
}
