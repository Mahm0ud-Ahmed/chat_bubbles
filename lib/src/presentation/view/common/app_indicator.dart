import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/enums.dart';

class AppIndicator extends StatelessWidget {
  final double? scale;
  final BoxFit? fit;
  const AppIndicator({super.key, this.scale, this.fit = BoxFit.contain});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: ThemeColor.primary.color),
    );
  }
}
