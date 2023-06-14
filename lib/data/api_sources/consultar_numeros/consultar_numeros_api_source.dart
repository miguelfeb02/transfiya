import 'package:transfiya_lib/data/index.dart';
import 'package:transfiya_lib/data/models/remote/index.dart';

mixin ConsultarNumerosApiSource {
  Future<Resultado<RespuestaConsultarNumerosRemoteModel>> consultarNumeros();
}
