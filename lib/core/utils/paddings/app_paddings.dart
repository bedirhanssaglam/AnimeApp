import 'package:flutter/material.dart' show EdgeInsets;

class AppPadding extends EdgeInsets {
  const AppPadding() : super.all(0);

  const AppPadding.smallAll() : super.all(4);

  const AppPadding.mediumAll() : super.all(16);

  const AppPadding.largeAll() : super.all(24);

  const AppPadding.smallVertical() : super.symmetric(vertical: 8);
}
