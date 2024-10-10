import 'package:chat_bubbles/src/core/utils/enums.dart';
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageWidget extends StatelessWidget {
  final dynamic image;
  final BoxFit fit;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;
  final Color? svgColor;
  final Widget Function(BuildContext context, Widget image)? imageBuilder;

  const ImageWidget({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.svgColor,
    this.imageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      margin: margin,
      decoration: decoration,
      child: imageBuilder != null ? imageBuilder!.call(context, buildImage(context)) : buildImage(context),
    );
  }

  Widget buildImage(BuildContext context) {
    switch (image.runtimeType) {
      case const (String):
        return _buildImageNetwork(image);
      default:
        return const SizedBox.shrink();
    }
  }

  dynamic _buildImageNetwork(String? url) {
    return CachedNetworkImage(
        fit: fit,
        imageUrl: url!,
        width: width,
        height: height,
        placeholder: (context, url) => Icon(FontAwesomeIcons.clapperboard, color: ThemeColor.primary.color),
        errorWidget: (context, url, error) => Icon(FontAwesomeIcons.clapperboard, color: ThemeColor.primary.color));
  }
}
