import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../../ui/theme/theme.dart';
import 'svg_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: svgPicture(
        assetName: SvgConstants.twitterLogo,
        color: Pallete.blueColor,
        height: 30,
      ),
    );
  }

  static List<Widget> bottomPages = [
    
  ];
}
