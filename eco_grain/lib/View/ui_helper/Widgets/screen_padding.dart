import 'package:flutter/material.dart';
import 'package:grain_dispenser/View/UI_Helper/responsive_screen_height.dart';
import 'package:grain_dispenser/View/ui_helper/responsive_screen_width.dart';

class ScreenPadding {
  ScreenPadding();

  static EdgeInsets screenPadding({required context}) {
    return EdgeInsets.only(
      top: screenHeight(context: context, responsive: 0.018),
      bottom: screenHeight(context: context, responsive: 0.018),
      left: screenWidth(context: context, responsive: 0.041),
      right: screenWidth(context: context, responsive: 0.041),
    );
  }
}
