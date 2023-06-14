import 'package:http/http.dart' as http;
import 'package:transfiya_lib/data/models/remote/index.dart';
import '../../../../data/index.dart';
import '../../../../data/utils/seguridad/cipher/cipher_object.dart';
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
    var url = '$baseUrl/usuario/celulares';

    return await getApi(url, (value) {
      return _cipherDecriptRespuesta(uuid!, value?["respuesta"]);
    }, autorization: uuid);
  }

  RespuestaConsultarNumerosRemoteModel _cipherDecriptRespuesta(
      String uuid, String encrypt) {
    String decrypt = CipherObject.decryptObject(uuid, encrypt);
    return RespuestaConsultarNumerosRemoteModel.fromRawJson(decrypt);
  }
}
