import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';

SvgPicture svgPicture({
  required String assetName,
  Color? color,
  double? height,
}) {
  return SvgPicture.asset(
    assetName,
    colorFilter: ColorFilter.mode(color ?? Pallete.blueColor, BlendMode.srcIn),
    height: height ?? 30,
  );
}
