import 'package:http/http.dart' as http;
import '../../../../data/index.dart';
import '../../../../domain/index.dart';
import '../../../index.dart';

class ActivarUsuarioApiSourceAdapter extends ApiSourceResponse
    implements ActivarUsuarioApiSource {
  ActivarUsuarioApiSourceAdapter(
    String uuid,
    String baseUrl,
    http.Client client,
    MyConnectivity connectivity,
    MySingletonSharedPreferences sharedPreferences,
  ) : super(uuid, baseUrl, client, connectivity, sharedPreferences);

  @override
  Future<Resultado<bool?>> activarUsuario(
      ParametrosActivarUsuario params) async {
    var url = '$baseUrl/activar-usuario';

    return await getApi(url, (value) {
      if (value?.containsKey("respuesta") && value?["respuesta"] != null) {}
      return true;
    }, autorization: uuid);
  }
}
