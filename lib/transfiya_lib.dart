import 'package:flutter/material.dart';

class Transfiya extends StatefulWidget {
  final String texto;
  const Transfiya({super.key, required this.texto});

  @override
  State<Transfiya> createState() => _TransfiyaState();
}

class _TransfiyaState extends State<Transfiya> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.texto);
  }
}
