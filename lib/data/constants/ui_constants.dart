import 'package:flutter/material.dart';

import '../../common/common.dart';
import 'svg_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: svgPicture(SvgConstants.twitterLogo, 30),
    );
  }
}
