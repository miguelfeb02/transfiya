import 'package:transfiya_lib/domain/index.dart';

import '../index.dart';

abstract class TransfiyaDataSource {
  Future<Resultado<bool?>> activarUsuario();
  Future<Resultado<RespuestaCosultarTransacciones?>> consultarTransacciones(
      ParametrosConsultarTransacciones params);
}
