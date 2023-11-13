import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';

Widget kRichText(
    {required String text,
    required String richText,
    required void Function()? onTap}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: text,
        ),
        TextSpan(
          text: richText,
          style: const TextStyle(color: Pallete.blueColor),
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
      ],
    ),
  );
}
