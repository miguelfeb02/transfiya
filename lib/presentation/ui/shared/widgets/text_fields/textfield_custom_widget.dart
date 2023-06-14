import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../data/utils/singleton_share_preferences.dart';

import '../../utils/index.dart';

class TextFieldCustomWidget extends StatefulWidget {
  final ErrorValidadorEnum? error;
  final bool? modoOscuro;
  final String? label;
  final String? tooltipText;
  final String? hintText;
  final double? fontSize;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? icon;
  final bool? filled;
  final String Function(String)? replaceText;
  final bool readOnly;
  final bool enabled;
  final bool? obscureText;
  final bool? counterText;
  final int minLines;
  final int? maxLines;
  final bool? suffixIconFijo;
  final EdgeInsetsGeometry? externalPadding;
  final Function()? onTap;

  const TextFieldCustomWidget({
    Key? key,
    required this.error,
    required this.controller,
    this.modoOscuro,
    this.label,
    this.tooltipText = '',
    this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.suffixIcon,
    this.prefixIcon,
    this.icon,
    this.fontSize,
    this.filled = false,
    this.replaceText,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.counterText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.suffixIconFijo,
    this.externalPadding,
    this.onTap,
  }) : super(key: key);

  @override
  State<TextFieldCustomWidget> createState() => _TextFieldCustomWidgetState();
}

class _TextFieldCustomWidgetState extends State<TextFieldCustomWidget> {
  GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final singleton = MySingleton();
    Size size = MediaQuery.of(context).size;
    final sizeCombinado = size.width + size.height;

    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: widget.externalPadding ??
                EdgeInsets.only(
                  top: (widget.label != null) ? size.height * 0.02 : 0.0,
                  left: size.width * 0.07,
                ),
            child: Row(
              children: [
                SizedBox(
                  width: (widget.label != null && widget.label!.length <= 31)
                      ? widget.label!.length * (size.width * 0.02290)
                      : size.width * 0.666,
                  child: Text(
                    widget.label ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: sizeCombinado * 0.011,
                        color: singleton.colorPrincipal),

                    maxLines: 4,
                    textAlign: TextAlign.left,
                    //overflow: TextOverflow.ellipsis,
                  ),
                ),
                Visibility(
                  visible: (widget.tooltipText != '') ? true : false,
                  child: GestureDetector(
                    key: key,
                    onTap: () {
                      _mostrarToolTip(context);
                    },
                    child: Icon(Icons.help,
                        size: sizeCombinado * 0.015,
                        color: singleton.colorPrincipal),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: sizeCombinado * 0.04,
              child: TextField(
                cursorColor: singleton.colorPrincipal,
                onTap: widget.onTap,
                controller: widget.controller,
                focusNode: widget.focusNode,
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                textCapitalization: widget.textCapitalization,
                readOnly: widget.readOnly,
                enabled: widget.enabled,
                obscureText: widget.obscureText!,
                obscuringCharacter: '●',
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                style: TextStyle(
                  letterSpacing:
                      widget.obscureText! ? sizeCombinado * 0.005 : null,
                  fontSize: sizeCombinado * 0.013,
                  color: widget.enabled ? singleton.colorTexto : Colors.grey,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      letterSpacing: 0,
                      fontSize: sizeCombinado * 0.013,
                      color: Colors.grey),
                  filled: (!widget.enabled || widget.filled!),
                  fillColor:
                      widget.enabled ? singleton.colorPrincipal : Colors.grey,
                  contentPadding: EdgeInsets.only(
                    left: size.width * 0.05,
                  ),
                  hintText: widget.hintText,
                  prefixIcon: widget.prefixIcon,
                  icon: widget.icon,
                  suffixIcon: widget.suffixIconFijo ?? false
                      ? Align(
                          widthFactor: 1.6,
                          child: widget.suffixIcon,
                        )
                      : (widget.controller?.text != '')
                          ? widget.enabled
                              ? widget.suffixIcon
                              : null
                          : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(sizeCombinado * 0.016),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: singleton.colorPrincipal ?? Colors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(sizeCombinado * 0.016),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: singleton.colorPrincipal ?? Colors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(sizeCombinado * 0.016),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: singleton.colorError ?? Colors.white,
                      style: BorderStyle.solid,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(sizeCombinado * 0.016),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.error == null
                          ? singleton.colorPrincipal ?? Colors.white
                          : singleton.colorError ?? Colors.white,
                      style: BorderStyle.solid,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(sizeCombinado * 0.016),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                onSubmitted: (value) {},
                onChanged: (value) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                },
              ),
            ),
            Visibility(
                visible: widget.error != null,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05, top: size.height * 0.01),
                      child: SizedBox(
                        width: size.width * 0.65,
                        child: Text(
                          ValidadorMap().mapperError(widget.error) ?? "",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: singleton.colorError ?? Colors.white,
                              fontSize: sizeCombinado * 0.01),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ],
    );
  }

  void _mostrarToolTip(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // final sizeCombinado = size.width + size.height;
    // CustomTooltip tootip = CustomTooltip(context,
    //     positiion: TooltipPositionEnum.top,
    //     text: widget.tooltipText ?? '',
    //     textStyle: TextStyle(
    //       fontSize: sizeCombinado * 0.011,
    //       color: Colors.white,
    //     ));
    // tootip.show(
    //   widgetKey: key,
    // );
  }
}
