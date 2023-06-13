import 'package:formz/formz.dart';
import '../../ui/shared/utils/index.dart';

class TelefonoField extends FormzInput<String, ErrorValidadorEnum> {
  const TelefonoField.pure([String value = '']) : super.pure(value);
  const TelefonoField.validated([String value = '']) : super.dirty(value);

  @override
  ErrorValidadorEnum? validator(String value) {
    return Validadores().validarTelefono(value);
  }
}
