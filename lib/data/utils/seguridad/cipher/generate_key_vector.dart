import 'package:timezone/standalone.dart' as tz;

import '../../../../presentation/config/transfiya_constants.dart';

class GenerateKeyVector {
  String generarKey(String uuid, String length, int intentos) {
    String resultado = generarValor(uuid, intentos);
    return reverse(padLeft(reverse(resultado), length));
  }

  String generarVector(String uuid, String length, int intentos) {
    String uuidReverse = reverse(uuid);
    String resultado = generarValor(uuidReverse, intentos);
    return reverse(padLeft(reverse(resultado), length));
  }

  String generarValor(String uuid, int intentos) {
    final bogota = tz.getLocation(TransfiyaConstants.appTimeZone);

    String num = uuid.replaceAll(RegExp("[^0-9]"), "").substring(0, 16);
    double dividendo = double.parse(num);
    DateTime fecha = tz.TZDateTime.from(DateTime.now(), bogota);
    double valorFecha = (validarTiempo(fecha, intentos) * 3);

    double resultado = (dividendo / valorFecha);
    return resultado.toString().replaceAll(".", "");
  }

  String reverse(String valor) {
    return valor.split('').reversed.join();
  }

  String padLeft(String uuid, String length) {
    String padLe;
    int tamano = int.parse(length);

    if (uuid.length < tamano) {
      padLe = padLeft("0$uuid", length);
    } else {
      if (uuid.length > tamano) {
        padLe = uuid.substring(0, tamano);
      } else {
        padLe = uuid;
      }
    }
    return padLe;
  }

  double validarTiempo(DateTime fecha, int intentos) {
    if (intentos == 1) {
      fecha = fecha.add(const Duration(minutes: 1));
    }
    if (intentos == 2) {
      fecha = fecha.subtract(const Duration(minutes: 1));
    }

    double valorFecha = (double.parse(
        "${fecha.year}${fecha.month}${fecha.day}${fecha.hour}${fecha.minute}"));
    return valorFecha;
  }
}
