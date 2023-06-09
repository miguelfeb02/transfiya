import 'package:http/http.dart' as http;
import '../../../data/index.dart';
import '../../../domain/index.dart';
import '../../index.dart';

class CerrarSesionApiSourceAdapter extends ApiSourceResponse
    implements ActivarUsuarioApiSource {
  CerrarSesionApiSourceAdapter(
    http.Client client,
    MyConnectivity connectivity,
    MySingletonSharedPreferences sharedPreferences,
  ) : super(client, connectivity, sharedPreferences);

  @override
  Future<Resultado<bool?>> activarUsuario(
      ParametrosActivarUsuario params) async {
    String baseUrl = MySingleton().baseUrl ?? "";
    var url = '$baseUrl/${TransfiyaConstants.appSucursal}/activar-usuario';
    String uuid = MySingleton().uuid ?? "";

    return await getApi(url, (value) {
      if (value?.containsKey("respuesta") && value?["respuesta"] != null) {}
      return true;
    }, autorization: uuid);
  }
}
