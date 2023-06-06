import 'package:flutter/material.dart';

import 'presentation/ui/shared/widgets/fields/text_fields/textfield_custom_stream_widget.dart';

class Transfiya extends StatefulWidget {
  final String texto;
  const Transfiya({super.key, required this.texto});

  @override
  State<Transfiya> createState() => _TransfiyaState();
}

class _TransfiyaState extends State<Transfiya> {
  @override
  Widget build(BuildContext context) {
    return TextFieldCustomStreamWidget(
      stream: Stream.value(""),
      controller: TextEditingController(),
    );
  }
}
