import 'package:flutter/material.dart';

import '../common/common.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
  ));
}

kNavigation(BuildContext context, Widget route) {
  return Navigator.of(context).push(MyCustomRouteTransition(route: route));
}
