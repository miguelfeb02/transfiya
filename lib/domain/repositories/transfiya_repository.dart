import '../entities/index.dart';

abstract class TransfiyaRepository {
  Future<bool> activarUsuario(ParametrosActivarUsuario params);

  Future<RespuestaCosultarTransacciones> consultarTransacciones(
      ParametrosConsultarTransacciones params);
}
