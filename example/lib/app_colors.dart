import 'package:flutter/material.dart';

class AppColors {
  static const int _primarColorValue = 0xFF045C56;
  static const int _accentColorValue = 0xFF00A04A;
  static const int _secondaryColorValue = 0xFFECB334;
  static const int _ternaryColorValue = 0xFFECB334;

  static const Map<int, Color> primaryColorCodes = {
    50: Color(0xFFE6EFEE),
    100: Color(0xFFB4CECC),
    200: Color(0xFF689D9A),
    300: Color(0xFF367D78),
    400: Color(0xFF1D6C67),
    500: Color(_primarColorValue),
    600: Color(0xFF04534D),
    700: Color(0xFF03403C),
    800: Color(0xFF022E2B),
    900: Color(0xFF022522),
  };

  static const Map<int, Color> accentColorCodes = {
    100: Color(0xFF02C358),
    200: Color(0xFF87A1FF),
    400: Color(0xFF00994A),
    500: Color(_accentColorValue),
    700: Color(0xFF083DFF),
    800: Color(0xFF007D4D),
    900: Color(0xFF0F6343),
  };

  static const Map<int, Color> secondaryColorCodes = {
    50: Color(0xFFFDF7EB),
    100: Color(0xFFF9E8C2),
    200: Color(0xFFF6D99A),
    300: Color(0xFFF4D185),
    400: Color(0xFFF0C25D),
    500: Color(_secondaryColorValue),
    600: Color(0xFFD4A12F),
    700: Color(0xFFDB8F2A),
    800: Color(0xFFA57D24),
    900: Color(0xFF473610),
  };

  static const MaterialColor primaryColor =
      MaterialColor(_primarColorValue, primaryColorCodes);

  static const MaterialColor primaryColorDark =
      MaterialColor(_primarColorValue, primaryColorCodes);

  static const MaterialColor accentColor =
      MaterialColor(_accentColorValue, accentColorCodes);

  static const MaterialColor secondaryColor =
      MaterialColor(_secondaryColorValue, secondaryColorCodes);

  static const MaterialColor ternaryColor =
      MaterialColor(_ternaryColorValue, secondaryColorCodes);

  static const Color hintColor = Color(0xFFBDBDBD);
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const Color icons = Color(0xFFFFFFFF);
  //static const Color divider = Color(0xFFBDBDBD);
  static const Color divider = Color(0xFFECB334);

  static const Color primaryText = Color(0xFF212121);
  static const Color secondaryText = Color(0xFF757575);

  static const Color errorColor = Color(0xFFB00020);
  static const Color infoColor = Color(0xFF2196F3);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color successColor = Color(0xFF2E7D32);
  static const Color successLightColorClear = Color(0xFF27AE60);
  static const Color successLightColor = Color(0xFF4CAF50);
  static const Color warningLightColor = Color(0xFFFFCC80);
  static const Color normalColor = Color(0xFF2D3243);

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greyColor = Color(0xFFCFD8DC);
  static const Color mateColor = Colors.white70;
  static const Color platinumColor = Color(0xFFECEEF1);
  static const Color silverColor = Color(0xFFEDF3FA);
  static const Color defaultColor = Color(0xFFF4F5F7);
  static const Color blackColor = Color(0xFF2D3243);
  static const Color appbarColor1 = Color(0xFF045C56);
  static const Color appbarColor2 = Color(0xFF045C56);
  static const Color darkColor1 = Color(0xFF002759);
  static const Color darkColor2 = Color(0xFF001A3D);
  static const Color darkColor3 = Color(0xFF002d7e);
  static const Color logingradientColor1 = Color(0XFFE8F0F9);
  static const Color logingradientColor2 = Color(0XFFFCF3EB);
  static const Color logingradientColor3 = Color(0XFFF3F7FB);
  static const Color logingradientColor4 = Color(0XFFFCF7F4);
  static const Color colorBorder = Color(0XFFCFD8DC);
  static const Color primaryContrastColor = Color(0xFF148577);
  static const Color colorModal = Color(0XFFE5E5EB);
  static const Color colorDark = Color(0XFF343a40);
  static const Color colorDarkDifuminado = Color(0XFF40424e);
  static const Color colorBackGroundDark = Color(0XFF01122C);
  static const Color colorOrangeligth = Color(0XFFffb400);
  static const Color colorOrangeMate = Color(0XFFe1953d);
}
