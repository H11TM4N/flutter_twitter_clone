import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';

class KelevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const KelevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.whiteColor,
          minimumSize: const Size(100, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Pallete.backgroundColor),
        ),
      ),
    );
  }
}
