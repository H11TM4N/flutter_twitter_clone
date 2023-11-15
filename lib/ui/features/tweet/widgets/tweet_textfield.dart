import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class TweetTextfield extends StatelessWidget {
  final TextEditingController controller;

  const TweetTextfield({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        fontSize: 22,
      ),
      decoration: const InputDecoration(
        hintText: "What's happening?",
        hintStyle: TextStyle(
          color: Pallete.greyColor,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        border: InputBorder.none,
      ),
      maxLines: null,
    );
  }
}


// TextField(
//         controller: controller,
//         keyboardType: TextInputType.multiline,
//         maxLines: null,
//         inputFormatters: [LengthLimitingTextInputFormatter(100)],
//         decoration: const InputDecoration(
//           hintText: 'What\'s happening?',
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           hintStyle: TextStyle(fontSize: 20),
//           border: InputBorder.none,
//         ),
//       ),