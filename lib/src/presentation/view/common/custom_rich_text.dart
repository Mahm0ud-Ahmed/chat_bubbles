// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../../core/utils/extension.dart';

class CustomRichText extends StatelessWidget {
  final String baseText;
  final List<TextSpan> children;
  final TextStyle? style;
  final TextAlign? align;
  final VoidCallback? onClick;
  final EdgeInsetsGeometry? margin;
  const CustomRichText({
    super.key,
    required this.baseText,
    required this.children,
    this.style,
    this.onClick,
    this.align,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: RichText(
        textAlign: align ?? TextAlign.start,
        text: TextSpan(
          text: baseText,
          style: style ?? context.bodyS,
          children: [
            // WidgetSpan(
            //   alignment: PlaceholderAlignment.baseline,
            //   baseline: TextBaseline.alphabetic,
            //   child: 2.pw,
            // ),
            ...children,
          ],
          recognizer: TapGestureRecognizer()..onTap = onClick,
        ),
      ),
    );
  }
}

TextSpan spanText({required String text, TextStyle? style, VoidCallback? onClick}) {
  return TextSpan(text: ' $text', style: style, recognizer: TapGestureRecognizer()..onTap = onClick);
}
