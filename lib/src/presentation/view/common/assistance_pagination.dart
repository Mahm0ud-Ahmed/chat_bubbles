// Flutter imports:
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Package imports:
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// Project imports:
import '../../../core/config/l10n/generated/l10n.dart';
import '../../../core/error/error.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/extension.dart';
import 'app_fade_shimmer.dart';
import 'custom_error_widget.dart';
import 'text_widget.dart';

enum ListType { list, grid, both }

Widget defaultLoading({Widget? child}) {
  return Center(
      child: child ??
          CircularProgressIndicator(
            color: ThemeColor.reverseBase.color,
          ));
}

Widget errorDuringBrowsing(BuildContext context, PagingController controller, [bool showImage = false]) {
  return Padding(
    padding: EdgeInsets.only(
        top: (context.sizeSide.smallSide / 1.5) / 3.5,
        right: context.sizeSide.smallSide * 0.03,
        left: context.sizeSide.smallSide * 0.03),
    child: CustomErrorWidget(
      showImage: showImage,
      message: (controller.error as AppError).statusMessage ?? '',
      btnTitle: 'Retry',
      onTab: controller.refresh,
    ),
  );
}

Widget noData(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(FontAwesomeIcons.hourglass, size: kIconLargeSize, color: ThemeColor.cardPrimary.color),
      (context.sizeSide.smallSide * .08).h,
      TextWidget(
        text: S.of(context).no_item_found,
        textAlign: TextAlign.center,
        style: context.titleM,
      ),
    ],
  );
}

Widget movieItemPlaceholder(BuildContext context) {
  return Row(
    children: [
      const AppFadeShimmer(
        width: 86,
        height: 86,
        radius: 16,
      ),
      (context.sizeSide.smallSide * .03).w,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const AppFadeShimmer(
              width: double.infinity,
              height: 16,
              radius: 8,
            ),
            (context.sizeSide.smallSide * .02).h,
            const AppFadeShimmer(
              width: double.infinity,
              height: 16,
              radius: 8,
            ),
          ],
        ),
      ),
    ],
  );
}
