import 'package:http/http.dart' as http;
import 'package:transfiya_lib/data/models/remote/index.dart';
import '../../../../data/index.dart';
import '../../../../data/utils/seguridad/cipher/cipher_object.dart';
import '../../../../domain/index.dart';
import '../../../index.dart';

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
  Future<Resultado<RespuestaConsultarTransaccionesRemoteModel>>
      consultarTransacciones(
          ParametrosConsultarTransaccionesRemoteModel params) async {
    var url = '$baseUrl/transacciones/consultar';
    String xBody = _cipherEncryptParametros(uuid!, params);
    return await getApi(url, (value) {
      return _cipherDecriptRespuesta(uuid!, value?["respuesta"]);
    }, xBody: xBody, autorization: uuid);
  }

  String _cipherEncryptParametros(
      String uuid, ParametrosConsultarTransaccionesRemoteModel params) {
    return CipherObject.encryptObject(uuid, params.toRawJson());
  }

  RespuestaConsultarTransaccionesRemoteModel _cipherDecriptRespuesta(
      String uuid, String encrypt) {
    String decrypt = CipherObject.decryptObject(uuid, encrypt);
    return RespuestaConsultarTransaccionesRemoteModel.fromRawJson(decrypt);
  }
}
