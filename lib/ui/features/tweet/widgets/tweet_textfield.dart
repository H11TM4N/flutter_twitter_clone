import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TweetTextfield extends StatelessWidget {
  final TextEditingController controller;

  const TweetTextfield({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 8),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        inputFormatters: [LengthLimitingTextInputFormatter(100)],
        decoration: const InputDecoration(
          hintText: 'What\'s happening?',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(fontSize: 20),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
