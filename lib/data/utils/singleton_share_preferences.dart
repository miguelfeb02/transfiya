// ignore_for_file: recursive_getters

import 'package:flutter/material.dart';

abstract class MySingletonSharedPreferences {
  String? get uuid => uuid;

  set uuid(String? uuid);

  String? get baseUrl => baseUrl;

  set baseUrl(String? baseUrl);

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
  String? uuid;

  @override
  String? baseUrl;

  @override
  Color? primaryColorLigth;

  @override
  Color? primaryColorDark;
}
