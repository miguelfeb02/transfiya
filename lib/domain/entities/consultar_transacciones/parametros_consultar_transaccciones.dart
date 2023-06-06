// To parse this JSON data, do

import 'dart:convert';

class ParametrosConsultarTransacciones {
  String tipo;
  String estado;

  ParametrosConsultarTransacciones({
    required this.tipo,
    required this.estado,
  });

  factory ParametrosConsultarTransacciones.fromRawJson(String str) =>
      ParametrosConsultarTransacciones.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParametrosConsultarTransacciones.fromJson(
          Map<String, dynamic> json) =>
      ParametrosConsultarTransacciones(
        tipo: json["tipo"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "tipo": tipo,
        "estado": estado,
      };
}
