import 'dart:developer';

import 'cipher_util.dart';
import 'generate_key_vector.dart';

class CipherObject<T> {
  static encryptObject(String uuid, String xBody) {
    int intentos = 0;
    String? resultado;

    do {
      String key = GenerateKeyVector().generarKey(uuid, "16", intentos);
      String vector = GenerateKeyVector().generarVector(uuid, "16", intentos);

      resultado = CipherUtils.encryptAES(key, vector, xBody);

      if (resultado == null) {
        intentos = intentos + 1;
      }
    } while (resultado == null && intentos <= 1);

    if (resultado == null) {
      log("Error, no fue posible encriptar la información.",
          name: 'errorEncryptObject');
    }
    return resultado;
  }

  static decryptObject(String uuid, String xBody) {
    int intentos = 0;
    String? resultado;

    do {
      String key = GenerateKeyVector().generarKey(uuid, "16", intentos);
      String vector = GenerateKeyVector().generarVector(uuid, "16", intentos);

      resultado = CipherUtils.decryptAES(key, vector, xBody);

      if (resultado == null) {
        intentos = intentos + 1;
      }
    } while (resultado == null && intentos <= 2);

    if (resultado == null) {
      log("Error, no fue posible desencriptar la información #.",
          name: 'errorDecryptObject');
    }
    return resultado;
  }
}
