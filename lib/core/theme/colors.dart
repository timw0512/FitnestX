import 'package:flutter/material.dart';

Color hexToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}

class AppColors {
  static final Color gray_1 = hexToColor("#7B6F72");
  static final Color gray_2 = hexToColor("#ADA4A5");
  static final Color gray_3 = hexToColor("#DDDADA");
  static final Color white = hexToColor("#FFFFFF");
  static final Color black = hexToColor("#1D1617");
  static final Color border = hexToColor("#F7F8F8");
  static final Color success = hexToColor("#42D742");
  static final Color warning = hexToColor("#FFD600");
  static final Color danger = hexToColor("#FF0000");
  static final LinearGradient blueLinear = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      hexToColor("#92A3FD"),
      hexToColor("#9DCEFF"),
    ],
  );
  static final LinearGradient purpleLinear = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      hexToColor("#C58BF2"),
      hexToColor("#EEA4CE"),
    ],
  );
  static final LinearGradient caloriesLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      hexToColor("#C58BF2"),
      hexToColor("#B4C0FE"),
    ],
  );
  static final LinearGradient progressBarLinear = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      hexToColor("#C58BF2"),
      hexToColor("#92A3FD"),
    ],
  );
  static final LinearGradient waterIntakeLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      hexToColor("#C58BF2"),
      hexToColor("#B4C0FE"),
    ],
  );
  static final LinearGradient logoLinear = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      hexToColor("#9DCEFF"),
      hexToColor("#CC8FED"),
    ],
  );
}