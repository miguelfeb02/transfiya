import 'package:transfiya_lib/data/index.dart';
import 'package:transfiya_lib/domain/index.dart';

mixin ConsultarTransaccionesApiSource {
  Future<Resultado<RespuestaCosultarTransacciones>> consultarTransacciones(
      ParametrosConsultarTransacciones params);
}
