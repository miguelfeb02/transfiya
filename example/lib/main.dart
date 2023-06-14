import 'package:flutter/material.dart';
import 'dart:async';

import 'package:transfiya_lib/transfiya_lib.dart';
import 'package:transfiya_lib_example/app_colors.dart';

import 'app_assets.dart';
import 'app_bar_curve.dart';
import 'app_bar_wave.dart';
import 'bottom_navbar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safePadding = MediaQuery.of(context).padding.top;
    double curveHeight =
        size.height * ((((safePadding * 100) / size.height) + 14) / 100);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TransfiyaLib(
          baseUrl: "",
          appBar: SizedBox(height: curveHeight, child: const AppBarWaves()),
          curves: SizedBox(height: curveHeight, child: const AppBarCurve()),
          logo: _retornarLogo(MediaQuery.of(context).padding.top),
          bottonNavigator: const BottomNavBarWidget(
            indexMenuActivo: 0,
          ),
          colorPrincipal: AppColors.primaryColor,
          colorSecundario: AppColors.secondaryColor,
          colorBackground: const Color(0xFFECEEF1),
          colorTexto: Colors.grey,
          colorError: AppColors.errorColor,
        ));
  }

  Widget _retornarLogo(double safePadding) {
    final size = MediaQuery.of(context).size;
    double topPosition = safePadding + (size.height * 0.015);
    final sizeCombinado = size.width + size.height;
    return Positioned(
        top: topPosition,
        left: size.width * 0.04,
        child: SizedBox(
            width: size.width * 0.17,
            child: Image.asset(
              AppAssets.imagen_isotipo_appbar,
              height: sizeCombinado * 0.05,
              fit: BoxFit.cover,
            )));
  }
}
