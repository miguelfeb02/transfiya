import 'package:transfiya_lib/data/models/remote/index.dart';
import 'package:transfiya_lib/domain/entities/index.dart';

class RespuestaConsultarNumerosMapper {
  static RespuestaConsultarNumeros fromRemoteModel(
      RespuestaConsultarNumerosRemoteModel
          respuestaConsultarNumerosRemoteModel) {
    RespuestaConsultarNumeros respuestaConsultarNumeros =
        RespuestaConsultarNumeros(
            listaNumeros: List<String>.from(
                respuestaConsultarNumerosRemoteModel.listaNumeros));

    return respuestaConsultarNumeros;
  }

  static RespuestaConsultarNumerosRemoteModel fromEntity(
      RespuestaConsultarNumeros respuestaConsultarNumeros) {
    RespuestaConsultarNumerosRemoteModel respuestaConsultarNumerosRemoteModel =
        RespuestaConsultarNumerosRemoteModel(
            listaNumeros:
                List<String>.from(respuestaConsultarNumeros.listaNumeros));

    return respuestaConsultarNumerosRemoteModel;
  }
}
