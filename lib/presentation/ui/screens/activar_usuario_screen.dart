import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfiya_lib/presentation/cubits/index.dart';

import '../shared/utils/index.dart';

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
    final numero = context.watch<ActivarUsuarioCubit>().state.telefono;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setearTelefono(value);
              },
              decoration: InputDecoration(
                  errorText: ValidadorMap().mapperError(numero.displayError)),
            ),
            const SizedBox(
              height: 30,
            ),
            FloatingActionButton(
              onPressed: onSubmit,
            )
          ],
        ),
      ),
    );
  }

  setearTelefono(String value) {
    context.read<ActivarUsuarioCubit>().onTelefonoChanged(value);
  }

  onSubmit() {
    context.read<ActivarUsuarioCubit>().onSubmit();
  }
}
