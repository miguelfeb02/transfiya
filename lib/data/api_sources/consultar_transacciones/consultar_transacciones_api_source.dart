import 'package:transfiya_lib/data/index.dart';
import 'package:transfiya_lib/data/models/remote/index.dart';
import 'package:transfiya_lib/domain/index.dart';

mixin ConsultarTransaccionesApiSource {
  Future<Resultado<RespuestaConsultarTransaccionesRemoteModel>>
      consultarTransacciones(
          ParametrosConsultarTransaccionesRemoteModel params);
}
