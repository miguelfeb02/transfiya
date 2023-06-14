import '../../domain/index.dart';
import '../index.dart';
import '../mappers/index.dart';

class TransfiyaRepositoryAdapter implements TransfiyaRepository {
  final ActivarUsuarioApiSource activarUsuarioApiSource;
  final ConsultarTransaccionesApiSource consultarTransaccionesApiSource;
  final ConsultarNumerosApiSource consultarNumerosApiSource;
  TransfiyaRepositoryAdapter(this.activarUsuarioApiSource,
      this.consultarTransaccionesApiSource, this.consultarNumerosApiSource);

// REPOSITORY ADAPTER ACTIVAR USUARIO
  @override
  Future<bool?> activarUsuario(
      ParametrosActivarUsuarioRemoteModel params) async {
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

// REPOSITORY ADAPTER CONSULTAR TRANSACCIONES
  @override
  Future<RespuestaConsultarTransacciones> consultarTransacciones(
      ParametrosConsultarTransaccionesRemoteModel params) async {
    final resultadoApi =
        await consultarTransaccionesApiSource.consultarTransacciones(params);

    if (ValidateStatusEnum.validateStatus(
            resultadoApi.status.toString(), StatusEnum.error.toString()) ==
        true) {
      throw (ErrorResult(
          code: resultadoApi.error?.code,
          message: resultadoApi.error?.message));
    }

    return RespuestaConsultarTransaccionesMapper.fromRemoteModel(
        resultadoApi.data!);
  }

  // REPOSITORY ADAPTER CONSULTAR NUMEROS
  @override
  Future<RespuestaConsultarNumeros> consultarNumeros() async {
    final resultadoApi = await consultarNumerosApiSource.consultarNumeros();

    if (ValidateStatusEnum.validateStatus(
            resultadoApi.status.toString(), StatusEnum.error.toString()) ==
        true) {
      throw (ErrorResult(
          code: resultadoApi.error?.code,
          message: resultadoApi.error?.message));
    }

    return RespuestaConsultarNumerosMapper.fromRemoteModel(resultadoApi.data!);
  }
}
