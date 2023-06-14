import '../entities/index.dart';

abstract class TransfiyaRepository {
  Future<bool?> activarUsuario(ParametrosActivarUsuarioRemoteModel params);

  Future<RespuestaConsultarTransacciones?> consultarTransacciones(
      ParametrosConsultarTransaccionesRemoteModel params);

  Future<RespuestaConsultarNumeros> consultarNumeros();
}
