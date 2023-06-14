// To parse this JSON data, do

import 'dart:convert';

class ParametrosActivarUsuarioRemoteModel {
  String celular;
  bool aceptarTerminosYCondiciones;

  ParametrosActivarUsuarioRemoteModel({
    required this.celular,
    required this.aceptarTerminosYCondiciones,
  });

  factory ParametrosActivarUsuarioRemoteModel.fromRawJson(String str) =>
      ParametrosActivarUsuarioRemoteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParametrosActivarUsuarioRemoteModel.fromJson(
          Map<String, dynamic> json) =>
      ParametrosActivarUsuarioRemoteModel(
        celular: json["celular"],
        aceptarTerminosYCondiciones: json["aceptarTerminosYCondiciones"],
      );

  Map<String, dynamic> toJson() => {
        "celular": celular,
        "aceptarTerminosYCondiciones": aceptarTerminosYCondiciones,
      };
}
