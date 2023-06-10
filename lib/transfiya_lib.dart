import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfiya_lib/presentation/di/index.dart';
import 'package:transfiya_lib/presentation/ui/screens/activar_usuario_screen.dart';
import 'presentation/blocs/activar_usuario_bloc/index.dart';

class Transfiya extends StatefulWidget {
  const Transfiya({super.key});

  @override
  State<Transfiya> createState() => _TransfiyaState();
}

class _TransfiyaState extends State<Transfiya> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ActivarUsuarioBloc(
        Injector().provideActivarUsuarioUseCase(),
      ),
      child: const ActivarUsuarioScreen(),
    );
  }
}
