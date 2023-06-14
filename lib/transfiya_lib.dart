import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfiya_lib/data/utils/singleton_share_preferences.dart';

import 'presentation/cubits/index.dart';
import 'presentation/di/index.dart';
import 'presentation/ui/pasos_transfiya/index.dart';

class TransfiyaLib extends StatefulWidget {
  final String baseUrl;
  final Widget appBar;
  final Widget? curves;
  final Widget logo;
  final Widget bottonNavigator;
  final Color colorPrincipal;
  final Color colorSecundario;
  final Color colorBackground;
  final Color colorError;
  final Color colorTexto;
  const TransfiyaLib({
    super.key,
    required this.baseUrl,
    required this.appBar,
    this.curves,
    required this.logo,
    required this.bottonNavigator,
    required this.colorPrincipal,
    required this.colorSecundario,
    required this.colorBackground,
    required this.colorError,
    required this.colorTexto,
  });

  @override
  State<TransfiyaLib> createState() => _TransfiyaState();
}

class _TransfiyaState extends State<TransfiyaLib> {
  @override
  void initState() {
    super.initState();
    setearVariablesIniciales();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.colorBackground,
        body: Stack(
          children: [
            widget.appBar,
            widget.curves ?? Container(),
            widget.logo,
            pasoActivarUsuario(),
          ],
        ),
        bottomNavigationBar: widget.bottonNavigator);
  }

  pasoActivarUsuario() {
    return BlocProvider(
        create: (_) =>
            ActivarUsuarioCubit(Injector().provideActivarUsuarioUseCase()),
        child: const PasoActivarUsuarioWidget());
  }

  setearVariablesIniciales() {
    MySingleton().baseUrl = widget.baseUrl;
    MySingleton().colorPrincipal = widget.colorPrincipal;
    MySingleton().colorSecundario = widget.colorSecundario;
    MySingleton().colorError = widget.colorError;
    MySingleton().colorTexto = widget.colorTexto;
  }
}
