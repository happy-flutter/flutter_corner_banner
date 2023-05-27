import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'banner_positon.dart';

//Custom Clipper for banner shape
class BannerClipper extends CustomClipper<Path> {
  final BannerPosition position;
  final double contentRatio;

  BannerClipper(this.position, this.contentRatio);

  @override
  Path getClip(Size size) {
    var path = Path();

    switch (position) {
      case BannerPosition.topRight:
        path.moveTo(0, 0);
        path.lineTo(contentRatio / math.sqrt2 * size.width, 0);
        path.lineTo(
            size.width, (1 - (contentRatio / math.sqrt2)) * size.height);
        path.lineTo(size.width, size.height);
        break;
      case BannerPosition.topLeft:
        path.moveTo(size.width, 0);
        path.lineTo((1 - (contentRatio / math.sqrt2)) * size.width, 0);
        path.lineTo(0, (1 - (contentRatio / math.sqrt2)) * size.height);
        path.lineTo(0, size.height);
        break;
      case BannerPosition.bottomLeft:
        path.moveTo(0, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(
            size.width * (1 - (contentRatio / math.sqrt2)), size.height);
        path.lineTo(0, size.height * (contentRatio / math.sqrt2));
        break;
      case BannerPosition.bottomRight:
        path.moveTo(size.width, 0);
        path.lineTo(size.width, size.height * (contentRatio / math.sqrt2));
        path.lineTo(size.width * (contentRatio / math.sqrt2), size.height);
        path.lineTo(0, size.height);
        break;
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
