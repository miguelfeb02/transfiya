// ignore_for_file: recursive_getters

import 'package:flutter/material.dart';

abstract class MySingletonSharedPreferences {
  String? get uuid => uuid;

  set uuid(String? uuid);

  String? get baseUrl => baseUrl;

  set baseUrl(String? baseUrl);

  Color? get colorPrincipal => colorPrincipal;

  set colorPrincipal(Color? colorPrincipal);

  Color? get colorSecundario => colorSecundario;

  set colorSecundario(Color? colorSecundario);

  Color? get colorError => colorError;

  set colorError(Color? colorError);

  Color? get colorTexto => colorTexto;

  set colorTexto(Color? colorTexto);
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
  Color? colorPrincipal;

  @override
  Color? colorSecundario;

  @override
  Color? colorError;

  @override
  Color? colorTexto;
}
