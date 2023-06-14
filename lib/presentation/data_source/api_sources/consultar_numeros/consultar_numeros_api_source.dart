import 'package:http/http.dart' as http;
import 'package:transfiya_lib/data/models/remote/index.dart';
import '../../../../data/index.dart';
import '../../../index.dart';

class ConsultarNumerosApiSourceAdapter extends ApiSourceResponse
    implements ConsultarNumerosApiSource {
  ConsultarNumerosApiSourceAdapter(
    String uuid,
    String baseUrl,
    http.Client client,
    MyConnectivity connectivity,
    MySingletonSharedPreferences sharedPreferences,
  ) : super(uuid, baseUrl, client, connectivity, sharedPreferences);

  @override
  Future<Resultado<RespuestaConsultarNumerosRemoteModel>>
      consultarNumeros() async {
    var url = '$baseUrl/activar-usuario';

    return await getApi(url, (value) {
      if (value?.containsKey("respuesta") && value?["respuesta"] != null) {}
      return RespuestaConsultarNumerosRemoteModel(listaNumeros: []);
    }, autorization: uuid);
  }
}
