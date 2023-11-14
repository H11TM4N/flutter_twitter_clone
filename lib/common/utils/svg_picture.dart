import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture svgPicture({
  required String assetName,
  required Color color,
  required double height,
}) {
  return SvgPicture.asset(
    assetName,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    height: height,
  );
}
