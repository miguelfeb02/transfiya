import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfiya_lib/domain/index.dart';
import 'package:transfiya_lib/presentation/cubits/activar_usuario_cubit/index.dart';

class ActivarUsuarioCubit extends Cubit<ActivarUsuarioState> {
  final ActivarUsuarioUseCase activarUsuarioUseCase;

  ActivarUsuarioCubit(
    this.activarUsuarioUseCase,
  ) : super(ActivarUsuarioState());

  void onTelefonoChanged(String value) {
    emit(state.copyWith(telefono: TelefonoField.validated(value)));
  }

  void aceptarTerminosChangedChanged(String value) {
    emit(state.copyWith(aceptaTerminos: value));
  }
}
