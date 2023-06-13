import '../enums/index.dart';

class ValidadorMap {
  mapperError(ErrorValidadorEnum? enumerador) {
    switch (enumerador) {
      case ErrorValidadorEnum.empty:
        return "Campo vacio";
      case ErrorValidadorEnum.minLength:
        return "Minimo 10 caracteres";
      default:
        "";
    }
  }
}
