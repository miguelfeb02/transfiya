import '../../domain/index.dart';
import '../index.dart';

class TransfiyaRepositoryAdapter implements TransfiyaRepository {
  final ActivarUsuarioApiSource activarUsuarioApiSource;
  final ConsultarTransaccionesApiSource consultarTransaccionesApiSource;
  TransfiyaRepositoryAdapter(
    this.activarUsuarioApiSource,
    this.consultarTransaccionesApiSource,
  );

  @override
  Future<bool?> activarUsuario(ParametrosActivarUsuario params) async {
    final resultadoApi = await activarUsuarioApiSource.activarUsuario(params);

    if (ValidateStatusEnum.validateStatus(
            resultadoApi.status.toString(), StatusEnum.error.toString()) ==
        true) {
      throw (ErrorResult(
          code: resultadoApi.error?.code,
          message: resultadoApi.error?.message));
    }

    return resultadoApi.data == true;
  }

  @override
  Future<RespuestaCosultarTransacciones?> consultarTransacciones(
      ParametrosConsultarTransacciones params) async {
    final resultadoApi =
        await consultarTransaccionesApiSource.consultarTransaciones(params);

    if (ValidateStatusEnum.validateStatus(
            resultadoApi.status.toString(), StatusEnum.error.toString()) ==
        true) {
      throw (ErrorResult(
          code: resultadoApi.error?.code,
          message: resultadoApi.error?.message));
    }

    return resultadoApi.data;
  }
}
