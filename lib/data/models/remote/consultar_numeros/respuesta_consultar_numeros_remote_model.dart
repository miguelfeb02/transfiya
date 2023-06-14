import 'dart:convert';

class RespuestaConsultarNumerosRemoteModel {
  List<String> listaNumeros;

  RespuestaConsultarNumerosRemoteModel({
    required this.listaNumeros,
  });

  factory RespuestaConsultarNumerosRemoteModel.fromRawJson(String str) =>
      RespuestaConsultarNumerosRemoteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RespuestaConsultarNumerosRemoteModel.fromJson(
          Map<String, dynamic> json) =>
      RespuestaConsultarNumerosRemoteModel(
        listaNumeros: List<String>.from(json["listaNumeros"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "listaNumeros": List<dynamic>.from(listaNumeros.map((x) => x)),
      };
}
