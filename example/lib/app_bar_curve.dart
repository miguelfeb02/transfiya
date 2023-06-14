import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBarCurve extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCurve({
    Key? key,
  }) : super(key: key);
  @override
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
            clipper: WaveClipCurve(),
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
                    AppColors.ternaryColor,
                    AppColors.ternaryColor
                  ])),
            ),
          )),
    );
  }
}

class WaveClipCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final limiteInferior = size.height * 0.80;
    final topWidhtPoint = size.width * 0.30;
    final bottomWidhtPoint = size.width * 0.2;
    //final lowpoint = size.height * 0.66;

    // path.moveTo(0, limiteInferior * 0.10);
    path.moveTo(topWidhtPoint, 0);
    path.lineTo(topWidhtPoint, 0);
    path.lineTo(0, 0);
    //path.lineTo(size.width * 0.30, limiteInferior);
    path.lineTo(0, limiteInferior);
    path.lineTo(bottomWidhtPoint, limiteInferior);
    path.quadraticBezierTo(size.width * 0.22, size.height * 0.80,
        size.width * 0.23, size.height * 0.76);
    path.lineTo(size.width * 0.32, size.height * 0.1);
    path.quadraticBezierTo(
        size.width * 0.33, size.height * 0.02, topWidhtPoint, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
