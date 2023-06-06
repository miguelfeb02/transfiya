// To parse this JSON data, do

import 'dart:convert';

class ParametrosActivarUsuario {
  String celular;
  bool aceptarTerminosYCondiciones;

  ParametrosActivarUsuario({
    required this.celular,
    required this.aceptarTerminosYCondiciones,
  });

  factory ParametrosActivarUsuario.fromRawJson(String str) =>
      ParametrosActivarUsuario.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParametrosActivarUsuario.fromJson(Map<String, dynamic> json) =>
      ParametrosActivarUsuario(
        celular: json["celular"],
        aceptarTerminosYCondiciones: json["aceptarTerminosYCondiciones"],
      );

  Map<String, dynamic> toJson() => {
        "celular": celular,
        "aceptarTerminosYCondiciones": aceptarTerminosYCondiciones,
      };
}
