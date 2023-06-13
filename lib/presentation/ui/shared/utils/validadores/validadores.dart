import '../enums/errores_validador_enum.dart';

class Validadores {
  validarTelefono(String value) {
    if (value.isEmpty) {
      return ErrorValidadorEnum.empty;
    } else if (value.length < 10) {
      return ErrorValidadorEnum.minLength;
    } else {
      return null;
    }
  }
}
