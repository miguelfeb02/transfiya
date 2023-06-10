import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfiya_lib/domain/index.dart';
import 'activar_usuario_states.dart';

class ActivarUsuarioBloc extends Cubit<ActivarUsuarioState> {
  final ActivarUsuarioUseCase activarUsuarioUseCase;

  ActivarUsuarioBloc(
    this.activarUsuarioUseCase,
  ) : super(const ActivarUsuarioState(
          telefono: "",
          aceptaTerminos: "",
        ));

  void onTelefonoChanged(String value) {
    emit(state.copyWith(telefono: value));
  }

  void aceptarTerminosChangedChanged(String value) {
    emit(state.copyWith(aceptaTerminos: value));
  }
}
