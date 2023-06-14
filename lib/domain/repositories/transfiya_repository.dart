import '../entities/index.dart';

abstract class TransfiyaRepository {
  Future<bool?> activarUsuario(ParametrosActivarUsuario params);

  Future<RespuestaConsultarTransacciones?> consultarTransacciones(
      ParametrosConsultarTransaccionesRemoteModel params);

  Future<RespuestaConsultarNumeros> consultarNumeros();
}
