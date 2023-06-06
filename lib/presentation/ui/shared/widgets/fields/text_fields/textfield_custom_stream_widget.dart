import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/index.dart';

class TextFieldCustomStreamWidget extends StatefulWidget {
  final Stream<String> stream;
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

  const TextFieldCustomStreamWidget({
    Key? key,
    required this.stream,
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
  State<TextFieldCustomStreamWidget> createState() =>
      _TextFieldCustomStreamWidgetState();
}

class _TextFieldCustomStreamWidgetState
    extends State<TextFieldCustomStreamWidget> {
  GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final singleton = MySingleton();
    Size size = MediaQuery.of(context).size;
    final sizeCombinado = size.width + size.height;
    final modoOscuro = widget.modoOscuro ?? false;
    return StreamBuilder<String>(
      stream: widget.stream,
      builder: (context, snapshot) {
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
                      width:
                          (widget.label != null && widget.label!.length <= 31)
                              ? widget.label!.length * (size.width * 0.02290)
                              : size.width * 0.666,
                      child: Text(
                        widget.label ?? '',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: sizeCombinado * 0.011,
                            color: modoOscuro
                                ? singleton.primaryColorLigth
                                : singleton.primaryColorDark),
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
                        child: Icon(
                          Icons.help,
                          size: sizeCombinado * 0.015,
                          color: modoOscuro
                              ? singleton.primaryColorLigth
                              : singleton.primaryColorDark,
                        ),
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
                    cursorColor: modoOscuro
                        ? singleton.primaryColorLigth
                        : singleton.primaryColorDark,
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
                      color: widget.enabled
                          ? modoOscuro
                              ? singleton.primaryColorLigth
                              : singleton.primaryColorDark
                          : singleton.primaryColorLigth,
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          letterSpacing: 0,
                          fontSize: sizeCombinado * 0.013,
                          color: modoOscuro ? Colors.grey : Colors.white24),
                      filled: (!widget.enabled || widget.filled!),
                      fillColor: widget.enabled
                          ? modoOscuro
                              ? singleton.primaryColorLigth
                              : singleton.primaryColorDark
                          : modoOscuro
                              ? singleton.primaryColorLigth
                              : singleton.primaryColorDark,
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
                          : ((snapshot.hasData &&
                                      (snapshot.data?.trim().isNotEmpty ??
                                          false)) ||
                                  widget.controller?.text != '')
                              ? widget.enabled
                                  ? widget.suffixIcon
                                  : null
                              : null,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(sizeCombinado * 0.016),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: singleton.primaryColorLigth ?? Colors.white,
                          width: 10,
                        ),
                        borderRadius:
                            BorderRadius.circular(sizeCombinado * 0.016),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: modoOscuro
                              ? singleton.primaryColorLigth ?? Colors.white
                              : singleton.primaryColorDark ?? Colors.white,
                          width: 10,
                        ),
                        borderRadius:
                            BorderRadius.circular(sizeCombinado * 0.016),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: singleton.primaryColorLigth ?? Colors.white,
                          style: BorderStyle.solid,
                          width: 10,
                        ),
                        borderRadius:
                            BorderRadius.circular(sizeCombinado * 0.016),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: snapshot.error == null
                              ? modoOscuro
                                  ? singleton.primaryColorLigth ?? Colors.white
                                  : singleton.primaryColorDark ?? Colors.white
                              : modoOscuro
                                  ? singleton.primaryColorLigth ?? Colors.white
                                  : singleton.primaryColorDark ?? Colors.white,
                          style: BorderStyle.solid,
                          width: 10,
                        ),
                        borderRadius:
                            BorderRadius.circular(sizeCombinado * 0.016),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onSubmitted: (value) {
                      _initializeTimer(context);
                      if (widget.replaceText != null) {
                        value = widget.replaceText!(value);
                      }
                      if (widget.onSubmitted != null) {
                        widget.onSubmitted!(value);
                      }
                    },
                    onChanged: (value) {
                      _initializeTimer(context);
                      if (widget.replaceText != null) {
                        value = widget.replaceText!(value);
                      }
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    },
                  ),
                ),
                Visibility(
                    visible: snapshot.error != null,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.05, top: size.height * 0.01),
                          child: SizedBox(
                            width: size.width * 0.65,
                            child: Text(
                              snapshot.error.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: modoOscuro
                                      ? singleton.primaryColorLigth ??
                                          Colors.white
                                      : singleton.primaryColorDark ??
                                          Colors.white,
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
      },
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

  void _initializeTimer(BuildContext context) {
    // MySingletonSharedPreferencesImpl().initializeTimer();
  }
}
