import 'package:flutter/material.dart' show BorderRadius;

class AppBorderRadius extends BorderRadius {
  AppBorderRadius() : super.circular(0);

  AppBorderRadius.circularSmall() : super.circular(6);

  AppBorderRadius.circularMedium() : super.circular(10);
}
