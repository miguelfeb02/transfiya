import '../enums/index.dart';

class ValidadorMap {
  String? mapperError(ErrorValidadorEnum? enumerador) {
    switch (enumerador) {
      case ErrorValidadorEnum.empty:
        return "Campo vacio";
      case ErrorValidadorEnum.minLength:
        return "Minimo 10 caracteres";
      case null:
        return null;
      default:
        "";
    }
    return null;
  }
}
