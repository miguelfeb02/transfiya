import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfiya_lib/domain/index.dart';

class ActivarUsuarioBloc extends BlocProvider {
  final ActivarUsuarioUseCase activarUsuarioUseCase;
  const ActivarUsuarioBloc(this.activarUsuarioUseCase,
      {super.key, required super.create});
}
