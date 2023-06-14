import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBarWaves extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWaves({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarWaves> createState() => _AppBarWavesState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _AppBarWavesState extends State<AppBarWaves> {
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ClipPath(
            clipper: WaveClip(),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.1,
                    0.7,
                  ],
                      colors: <Color>[
                    AppColors.appbarColor1,
                    AppColors.appbarColor2
                  ])),
            ),
          )),
    );
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final limiteInferior = size.height * 0.89;
    final rounderdFactor = size.height * 0.30;

    path.lineTo(size.width * 0.09, limiteInferior - rounderdFactor);
    path.quadraticBezierTo(
        size.width * 0.06, limiteInferior, rounderdFactor, limiteInferior);
    path.lineTo(size.width, limiteInferior);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
