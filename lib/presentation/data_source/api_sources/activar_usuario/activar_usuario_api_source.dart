import 'package:http/http.dart' as http;
import '../../../../data/index.dart';
import '../../../../data/utils/seguridad/cipher/cipher_object.dart';
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
      ParametrosActivarUsuarioRemoteModel params) async {
    var url = '$baseUrl/activar-usuario';
    final xBody = _cipherEncryptParametros(uuid!, params);
    return await getApi(url, (value) {
      return _cipherDecriptRespuesta(uuid!, value?["respuesta"]);
    }, xBody: xBody, autorization: uuid);
  }

  String _cipherEncryptParametros(
      String uuid, ParametrosActivarUsuarioRemoteModel params) {
    return CipherObject.encryptObject(uuid, params.toRawJson());
  }

  bool _cipherDecriptRespuesta(String uuid, String encrypt) {
    String decrypt = CipherObject.decryptObject(uuid, encrypt);
    return decrypt == "true";
  }
}
