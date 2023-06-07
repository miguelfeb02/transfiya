import '../../domain/index.dart';
import '../index.dart';

class TransfiyaRepositoryAdapter implements TransfiyaRepository {
  final TransfiyaDataSource dataSource;

  TransfiyaRepositoryAdapter(this.dataSource);

  @override
  Future<bool?> activarUsuario(ParametrosActivarUsuario params) async {
    final resultadoApi = await dataSource.activarUsuario();

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
    final resultadoApi = await dataSource.consultarTransacciones(params);

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
