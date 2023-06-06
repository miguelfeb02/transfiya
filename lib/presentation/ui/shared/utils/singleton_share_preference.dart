// ignore_for_file: recursive_getters

import 'package:flutter/material.dart';

abstract class MySingletonSharedPreferences {
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
  Color? primaryColorLigth;

  @override
  Color? primaryColorDark;
}
