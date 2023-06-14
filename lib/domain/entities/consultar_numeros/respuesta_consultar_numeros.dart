import 'dart:convert';

class RespuestaConsultarNumeros {
  List<String> listaNumeros;

  RespuestaConsultarNumeros({
    required this.listaNumeros,
  });

  factory RespuestaConsultarNumeros.fromRawJson(String str) =>
      RespuestaConsultarNumeros.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RespuestaConsultarNumeros.fromJson(Map<String, dynamic> json) =>
      RespuestaConsultarNumeros(
        listaNumeros: List<String>.from(json["listaNumeros"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "listaNumeros": List<dynamic>.from(listaNumeros.map((x) => x)),
      };
}
