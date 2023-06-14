import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustompainterWidget extends StatelessWidget {
  const CustompainterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: _PainterHeader1(context: context),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: _PainterHeader2(context: context),
            ),
          ),
        ],
      ),
    );
  }
}

class _PainterHeader1 extends CustomPainter {
  final BuildContext context;
  const _PainterHeader1({
    required this.context,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = const Color(0xFF1457AE);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    const alto = 3;
    path.lineTo(0, size.height * 0.27 * alto);
    path.quadraticBezierTo(size.width * 0.28, size.height * 0.29 * alto,
        size.width * 0.52, size.height * 0.24 * alto);
    path.quadraticBezierTo(size.width * 0.70, size.height * 0.21 * alto,
        size.width, size.height * 0.25 * alto);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _PainterHeader2 extends CustomPainter {
  final BuildContext context;
  const _PainterHeader2({
    required this.context,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(0.0, 50.0), radius: 120);
    final Gradient gradiente = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.accentColor.shade900,
          AppColors.accentColor.shade500,
        ]);
    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // lapiz.color = AppColors.accentColor.shade800;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    const alto = 2.9;
    path.lineTo(0, size.height * 0.235 * alto);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.265 * alto,
        size.width * 0.52, size.height * 0.205 * alto);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.18 * alto,
        size.width, size.height * 0.215 * alto);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
