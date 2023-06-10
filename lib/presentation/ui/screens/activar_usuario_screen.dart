import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfiya_lib/presentation/blocs/index.dart';

class ActivarUsuarioScreen extends StatefulWidget {
  const ActivarUsuarioScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ActivarUsuarioScreen> createState() => _ActivarUsuarioScreenState();
}

class _ActivarUsuarioScreenState extends State<ActivarUsuarioScreen> {
  @override
  Widget build(BuildContext context) {
    final numero = context.watch<ActivarUsuarioBloc>().state.telefono ?? "";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(numero),
            const SizedBox(
              height: 30,
            ),
            FloatingActionButton(
              onPressed: () {
                setearTelefono(Random().nextInt(999999999).toString());
              },
            )
          ],
        ),
      ),
    );
  }

  setearTelefono(String value) {
    context.read<ActivarUsuarioBloc>().onTelefonoChanged(value);
  }
}
