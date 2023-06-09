// ignore_for_file: recursive_getters

import 'package:flutter/material.dart';

abstract class MySingletonSharedPreferences {
  String? get token => token;

  set token(String? token);

  Color? get primaryColorLigth => primaryColorLigth;

  set primaryColorLigth(Color? primaryColorLigth);

  Color? get primaryColorDark => primaryColorDark;

  set primaryColorDark(Color? primaryColorDark);
}

class MySingleton implements MySingletonSharedPreferences {
  static final MySingleton _singleton = MySingleton._internal();

  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal();

  @override
  String? token;

  @override
  Color? primaryColorLigth;

  @override
  Color? primaryColorDark;
}
