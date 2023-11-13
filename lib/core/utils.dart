import 'package:flutter/material.dart';

import '../common/common.dart';

SnackBar kSnackBar(String text) {
  return SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
  );
}

kNavigation(BuildContext context, Widget route) {
  return Navigator.of(context).push(MyCustomRouteTransition(route: route));
}