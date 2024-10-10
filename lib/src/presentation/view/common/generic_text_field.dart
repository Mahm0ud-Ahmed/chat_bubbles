import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/utils/enums.dart';
import 'decoration_field.dart';

class GenericTextField extends StatelessWidget {
  final String? initialValue;
  final TextInputType? textType;
  final int? lines;
  final String? Function(String?)? validator;
  final Function()? onTab;
  final bool? obscureText;
  final bool? enableField;
  final EdgeInsets? margin;
  final Color? cursorColor;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final DecorationField? decorationField;

  const GenericTextField({
    super.key,
    this.initialValue,
    this.textType,
    this.obscureText = false,
    this.enableField = true,
    this.lines = 1,
    this.onTab,
    this.validator,
    this.cursorColor,
    this.margin,
    this.controller,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.autofillHints,
    this.inputFormatters,
    this.focusNode,
    this.decorationField,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      initialValue: initialValue,

      // controller: controller,
      onTap: onTab,
      keyboardType: textType,
      maxLines: lines,
      obscureText: obscureText!,
      // obscuringCharacter: '*',
      cursorColor: cursorColor ?? ThemeColor.secondary.color,
      
      cursorWidth: 1.5,
      style: context.bodyS,
      showCursor: true,
      enableSuggestions: true,
      enabled: enableField!,
      decoration: decorationField?.decorationField(context) ?? DecorationField().decorationField(context),
      validator: validator,
      onChanged: onChanged,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
    );
  }
}
