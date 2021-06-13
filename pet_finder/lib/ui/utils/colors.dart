import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      500: Color(_greenPrimaryValue),
    },
  );
  static const int _greenPrimaryValue = 0xFF20C3AF;

  static const MaterialColor purple = MaterialColor(
    _purplePrimaryValue,
    <int, Color>{
      500: Color(_purplePrimaryValue),
    },
  );
  static const int _purplePrimaryValue = 0xFF665577;

  static const MaterialColor pink = MaterialColor(
    _pinkPrimaryValue,
    <int, Color>{
      500: Color(_pinkPrimaryValue),
    },
  );
  static const int _pinkPrimaryValue = 0xFFF2B6B6;

  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      500: Color(_bluePrimaryValue),
    },
  );
  static const int _bluePrimaryValue = 0xFF0092E5;

  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      500: Color(_greyPrimaryValue),
      600: Color(0xFF8F8F8F),
      700: Color(0xFFC2C2C2),
    },
  );
  static const int _greyPrimaryValue = 0xFFC2C2C2;

  static const MaterialColor white = MaterialColor(
    _whitePrimaryValue,
    <int, Color>{
      500: Color(_whitePrimaryValue),
      600: Color(0xFFF4F4F4),
    },
  );
  static const int _whitePrimaryValue = 0xFFFFFFFF;
}
