import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfiya_lib/data/utils/singleton_share_preferences.dart';
import 'package:transfiya_lib/presentation/cubits/index.dart';

import '../shared/widgets/index.dart';

class PasoActivarUsuarioWidget extends StatefulWidget {
  const PasoActivarUsuarioWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PasoActivarUsuarioWidget> createState() => _PasoActivarUsuarioState();
}

class _PasoActivarUsuarioState extends State<PasoActivarUsuarioWidget> {
  final controllerText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubitState = context.watch<ActivarUsuarioCubit>().state;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.3,
        right: size.width * 0.05,
        left: size.width * 0.05,
      ),
      child: Container(
        height: size.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldCustomWidget(
                controller: controllerText,
                error: cubitState.telefono.displayError,
                onChanged: setearTelefono,
              ),
              const SizedBox(
                height: 30,
              ),
              FloatingActionButton(
                backgroundColor: MySingleton().colorPrincipal,
                onPressed: onSubmit,
              )
            ],
          ),
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
