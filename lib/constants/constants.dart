import 'package:flutter/cupertino.dart';

class Utilities {
  static final Utilities _utilities = Utilities._internal();

  factory Utilities() {
    return _utilities;
  }

  Utilities._internal();

  static double screenHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;

  static double screenWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
}
