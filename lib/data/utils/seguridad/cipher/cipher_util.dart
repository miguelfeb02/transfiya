import 'package:encrypt/encrypt.dart' as encrypt;

class CipherUtils {
  static String? encryptAES(String key, String iv, dynamic object) {
    try {
      final key0 = encrypt.Key.fromUtf8(key);
      final iv0 = encrypt.IV.fromUtf8(iv);

      final encrypter = encrypt.Encrypter(
          encrypt.AES(key0, mode: encrypt.AESMode.cbc, padding: "PKCS7"));

      final encrypted = encrypter.encrypt(object.toString(), iv: iv0);

      return encrypted.base64;
    } catch (e) {
      return null;
    }
  }

  static String? decryptAES(String key, String iv, String plainText) {
    try {
      final key0 = encrypt.Key.fromUtf8(key);
      final iv0 = encrypt.IV.fromUtf8(iv);

      final encrypter = encrypt.Encrypter(
          encrypt.AES(key0, mode: encrypt.AESMode.cbc, padding: "PKCS7"));
      final dencrypted = encrypter.decrypt64(plainText, iv: iv0);
      return dencrypted;
    } catch (e) {
      return null;
    }
  }
}
