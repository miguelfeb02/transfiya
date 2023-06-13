import 'package:formz/formz.dart';
import 'package:transfiya_lib/presentation/cubits/activar_usuario_cubit/index.dart';

final class ActivarUsuarioState with FormzMixin {
  final TelefonoField telefono;
  final String? aceptaTerminos;
  ActivarUsuarioState({
    this.telefono = const TelefonoField.pure(),
    this.aceptaTerminos,
  });

  ActivarUsuarioState copyWith({
    TelefonoField? telefono,
    String? aceptaTerminos,
  }) {
    return ActivarUsuarioState(
      telefono: telefono ?? this.telefono,
      aceptaTerminos: aceptaTerminos ?? this.aceptaTerminos,
    );
  }

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [telefono];
}
