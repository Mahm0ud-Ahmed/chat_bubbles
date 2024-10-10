// ignore_for_file: public_member_api_docs, sort_constructors_first

// Flutter imports:
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/enums.dart';

// Project imports:

class DecorationField {
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? errorText;
  InputBorder? border;
  InputBorder? enabledBorder;
  InputBorder? disabledBorder;
  InputBorder? focusedBorder;
  InputBorder? errorBorder;
  InputBorder? focusedErrorBorder;
  final bool? isBorder;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? contentPadding;
  final FloatingLabelBehavior? labelLock;
  final double? radiusBorder;
  Color? backgroundColor;
  Color? borderColor;
  final bool? fillBackgroundColor;
  DecorationField({
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.errorText,
    this.style,
    this.isBorder = true,
    this.constraints,
    this.contentPadding,
    this.labelLock = FloatingLabelBehavior.auto,
    this.radiusBorder = 8,
    this.backgroundColor,
    this.hintStyle,
    this.labelStyle,
    this.fillBackgroundColor,
    this.border,
    this.borderColor,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
  }) {
    backgroundColor ??= ThemeColor.base.color;
    borderColor ??= ThemeColor.secondary.color;
    border = OutlineInputBorder(
            borderSide: isBorder! ? BorderSide(width: 1, color: borderColor!) : BorderSide.none,
            borderRadius: BorderRadius.circular(radiusBorder ?? 0.0),
          );

    enabledBorder  = OutlineInputBorder(
            borderSide: isBorder! ? BorderSide(width: 1, color: borderColor!) : BorderSide.none,
            borderRadius: BorderRadius.circular(radiusBorder ?? 0.0),
          );

    disabledBorder ??= (isBorder!
        ? OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor!),
            borderRadius: BorderRadius.circular(radiusBorder ?? 0.0),
          )
        : InputBorder.none);

    focusedBorder =OutlineInputBorder(
            borderSide: isBorder! ? BorderSide(width: 1, color: borderColor!) : BorderSide.none,
            borderRadius: BorderRadius.circular(radiusBorder ?? 0.0),
          );

    errorBorder ??= OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColor.errorColor.color,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(radiusBorder ?? 0.0),
    );
    focusedErrorBorder ??= (isBorder!
        ? OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor!,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(radiusBorder ?? 0.0),
          )
        : InputBorder.none);
  }

  InputDecoration decorationField(BuildContext context) {
    return InputDecoration(
      filled: fillBackgroundColor,
      fillColor: backgroundColor,
      labelText: labelText,
      floatingLabelBehavior: labelLock,
      labelStyle: labelStyle ?? context.labelL,
      hintText: hintText,
      hintStyle: hintStyle ?? context.labelL,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      border: border,
      errorText: errorText,
      errorStyle: context.labelL?.copyWith(color: ThemeColor.errorColor.color),
      errorMaxLines: 2,
      enabledBorder: enabledBorder,
      disabledBorder: disabledBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: focusedErrorBorder,
      // contentPadding: contentPadding ??
      //     EdgeInsetsDirectional.only(start: .04.space(context), top: .0.space(context), bottom: .0.space(context)),
      constraints: constraints,
      alignLabelWithHint: true,
    );
  }

  DecorationField copyWith({
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? hintText,
    TextStyle? hintStyle,
    String? labelText,
    TextStyle? labelStyle,
    String? errorText,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? disabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    bool? isBorder,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? contentPadding,
    FloatingLabelBehavior? labelLock,
    double? radiusBorder,
    Color? backgroundColor,
    Color? borderColor,
    bool? fillBackgroundColor,
  }) {
    return DecorationField(
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      hintText: hintText ?? this.hintText,
      hintStyle: hintStyle ?? this.hintStyle,
      labelText: labelText ?? this.labelText,
      labelStyle: labelStyle ?? this.labelStyle,
      errorText: errorText ?? this.errorText,
      border: border ?? this.border,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
      isBorder: isBorder ?? this.isBorder,
      constraints: constraints ?? this.constraints,
      contentPadding: contentPadding ?? this.contentPadding,
      labelLock: labelLock ?? this.labelLock,
      radiusBorder: radiusBorder ?? this.radiusBorder,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      fillBackgroundColor: fillBackgroundColor ?? this.fillBackgroundColor,
    );
  }
}
