import 'package:http/http.dart' as http;
import '../../../data/index.dart';
import '../../../domain/index.dart';
import '../../index.dart';

class ConsultarTransaccionesApiSourceAdapter extends ApiSourceResponse
    implements ConsultarTransaccionesApiSource {
  ConsultarTransaccionesApiSourceAdapter(
    String uuid,
    String baseUrl,
    http.Client client,
    MyConnectivity connectivity,
    MySingletonSharedPreferences sharedPreferences,
  ) : super(uuid, baseUrl, client, connectivity, sharedPreferences);

  @override
  Future<Resultado<RespuestaCosultarTransacciones>> consultarTransacciones(
      ParametrosConsultarTransacciones params) async {
    var url = '$baseUrl/activar-usuario';

    return await getApi(url, (value) {
      if (value?.containsKey("respuesta") && value?["respuesta"] != null) {}
      return RespuestaCosultarTransacciones(
          transacciones: [], usuarioActivo: true);
    }, autorization: uuid);
  }
}
