import 'package:flutter/material.dart';

class KtextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;

  const KtextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(25),
          filled: true,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
