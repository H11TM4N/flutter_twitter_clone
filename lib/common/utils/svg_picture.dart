import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';

SvgPicture svgPicture(String assetName, double height) {
  return SvgPicture.asset(
    assetName,
    colorFilter: const ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn),
    height: height,
  );
}
