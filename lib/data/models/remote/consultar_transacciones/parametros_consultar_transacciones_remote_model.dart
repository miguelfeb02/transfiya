// To parse this JSON data, do

import 'dart:convert';

class ParametrosConsultarTransaccionesRemoteModel {
  String tipo;
  String estado;

  ParametrosConsultarTransaccionesRemoteModel({
    required this.tipo,
    required this.estado,
  });

  factory ParametrosConsultarTransaccionesRemoteModel.fromRawJson(String str) =>
      ParametrosConsultarTransaccionesRemoteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParametrosConsultarTransaccionesRemoteModel.fromJson(
          Map<String, dynamic> json) =>
      ParametrosConsultarTransaccionesRemoteModel(
        tipo: json["tipo"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "tipo": tipo,
        "estado": estado,
      };
}
