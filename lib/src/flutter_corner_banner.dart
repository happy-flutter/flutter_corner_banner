import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'banner_clipper.dart';
import 'banner_positon.dart';

const double _contentRatio = 3 / 4;
const double _maxBannerSize = 100;
const double _minBannerSize = 40;
const double _rotateAngle = math.pi / 4;

/// Widget to show a banner whith any child widget.
class CornerBanner extends StatelessWidget {
  ///Show Banner Or Not
  final bool showBanner;

  ///Banner position[BannerPosition]
  ///
  ///default is [BannerPosition.topRight]
  final BannerPosition bannerPosition;

  ///Text that shown on the Banner
  final String? bannerText;

  ///TextStyle for [bannerText]
  final TextStyle? bannerTextStyle;

  ///Icon that shown on the Banner
  ///If bannerIcon is provided, then [bannerText] wont be shown
  final Widget? bannerIcon;

  ///Rotate Icon or not
  ///
  ///Default value is False
  final bool bannerIconRotation;

  /// Banner Color
  final Color? bannerColor;

  /// Size of Banner
  ///
  /// Height & Width will be 1:1 aspect ratio.
  /// Max size is 100.0 & min size is 40.0
  final double bannerSize;

  /// Content Padding
  ///
  /// Default value is EdgeInsets.all(2.0)
  final EdgeInsets? contentPadding;

  /// Widget to show behind the banner
  final Widget? child;

  ///Suitable for use in column or listview or anykind of vertical list.
  ///then it will automatically take a height by given child.
  ///
  ///Otherwise height & width must be given or it will take all the available space it get.
  ///
  const CornerBanner({
    Key? key,
    this.showBanner = true,
    this.bannerPosition = BannerPosition.topRight,
    this.bannerText,
    this.bannerTextStyle,
    this.bannerSize = 40.0,
    this.bannerIcon,
    this.bannerIconRotation = false,
    this.bannerColor,
    this.child,
    this.contentPadding,
  })  : assert(bannerText != null || bannerIcon != null),
        super(key: key);

  Alignment _contentAlignment() {
    switch (bannerPosition) {
      case BannerPosition.topLeft:
        return Alignment.topLeft;
      case BannerPosition.topRight:
        return Alignment.topRight;
      case BannerPosition.bottomLeft:
        return Alignment.bottomLeft;
      case BannerPosition.bottomRight:
        return Alignment.bottomRight;
      default:
        return Alignment.topRight;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double bannerSizeActually =
        bannerSize.clamp(_minBannerSize, _maxBannerSize);

    final double contentSizeActually = bannerSizeActually * _contentRatio;

    final double halfBannerSize = bannerSize / 2;
    final double squareRoot = math.sqrt(
        (halfBannerSize * halfBannerSize) + (halfBannerSize * halfBannerSize));
    final double iconSizeActually = squareRoot / 2;

    return Stack(
      children: [
        Padding(
            padding: showBanner
                ? (bannerPosition == BannerPosition.topLeft ||
                        bannerPosition == BannerPosition.bottomLeft)
                    ? EdgeInsets.only(left: bannerSizeActually)
                    : EdgeInsets.only(right: bannerSizeActually)
                : EdgeInsets.zero,
            child: child),
        if (showBanner)
          Positioned(
            top: bannerPosition == BannerPosition.topLeft ||
                    bannerPosition == BannerPosition.topRight
                ? 0
                : null,
            bottom: bannerPosition == BannerPosition.bottomLeft ||
                    bannerPosition == BannerPosition.bottomRight
                ? 0
                : null,
            left: bannerPosition == BannerPosition.topLeft ||
                    bannerPosition == BannerPosition.bottomLeft
                ? 0
                : null,
            right: bannerPosition == BannerPosition.topRight ||
                    bannerPosition == BannerPosition.bottomRight
                ? 0
                : null,
            child: ClipPath(
              clipper: BannerClipper(bannerPosition, _contentRatio),
              child: Container(
                decoration:
                    BoxDecoration(color: bannerColor ?? Colors.blueAccent),
                height: bannerSizeActually,
                width: bannerSizeActually,
                child: Align(
                  alignment: _contentAlignment(),
                  child: Transform.rotate(
                    angle: (bannerIcon != null && !bannerIconRotation)
                        ? 0
                        : bannerPosition == BannerPosition.topLeft ||
                                bannerPosition == BannerPosition.bottomRight
                            ? -_rotateAngle
                            : _rotateAngle,
                    child: Container(
                      padding: contentPadding ?? const EdgeInsets.all(2),
                      height: contentSizeActually,
                      width: contentSizeActually,
                      child: bannerIcon != null
                          ? Align(
                              child: SizedBox(
                                  height: iconSizeActually,
                                  width: iconSizeActually,
                                  child: FittedBox(child: bannerIcon)))
                          : FittedBox(
                              child: Text(bannerText!,
                                  style: bannerTextStyle ??
                                      const TextStyle(color: Colors.white))),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
