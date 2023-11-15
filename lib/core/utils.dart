import 'package:flutter/material.dart';

import '../common/common.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
  ));
}

smoothNavigation(BuildContext context, Widget route) {
  return Navigator.of(context).push(MyCustomRouteTransition(route: route));
}

bottomToTopNavigation(BuildContext context, Widget route) {
  return Navigator.of(context).push(BottomToTopPageTransition(route: route));
}

String getUserName(String email) {
  return email.split('@')[0];
}
