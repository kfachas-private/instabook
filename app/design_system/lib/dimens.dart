// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class Dimens {
  static const double minPadding = 4;
  static const double halfPadding = 8;
  static const double standardPadding = 16;
  static const double largePadding = 24;
  static const double xLargePadding = 32;
  static const double xlLargePadding = 40;

  static const double inputDecorationPadding = 12;

  static const double circularProgress = 30;

  static const double minRadius = 4;
  static const double defaultRadius = 8;
  static const double standardRadius = 16;
  static const double largeRadius = 24;
  static const double xLargeRadius = 32;

  static const double h1TextSize = 64;
  static const double h2TextSize = 44;
  static const double h3TextSize = 24;
  static const double h6TextSize = 20;
  static const double body1TextSize = 18;
  static const double body2TextSize = 16;
  static const double subtitle1TextSize = 14;
  static const double subtitle2TextSize = 12;
  static const double halfTextSize = 11;
  static const double minTextSize = 10;

  static const double h1LineHeight = 72;
  static const double h2LineHeight = 52;
  static const double h3LineHeight = 32;
  static const double body1LineHeight = 28;
  static const double body2LineHeight = 24;
  static const double subtitle1LineHeight = 20;
  static const double subtitle2LineHeight = 16;

  static const double minAssetSize = 10;
  static const double halfAssetSize = 12;
  static const double halfMediumAssetSize = 14;
  static const double mediumAssetSize = 16;
  static const double standardAssetSize = 20;
  static const double largeAssetSize = 32;
  static const double xLargeAssetSize = 42;

  static const double minSizeButton = 38;
  static const double mediumSizeButton = kMinInteractiveDimension;
  static const double largeSizeButton = 58;

  static const double minSize = 4;
  static const double halfSize = 8;
  static const double standardSize = 16;
  static const double halfLargeSize = 20;
  static const double largeSize = 24;
  static const double xLargeSize = 32;
  static const double xlLargeSize = 40;

  static const double figmaSpacing = 12;

  static double minHeightPreferredSize(BuildContext context) => 36 * MediaQuery.of(context).size.height;
  static const double hd = 1920;
}
