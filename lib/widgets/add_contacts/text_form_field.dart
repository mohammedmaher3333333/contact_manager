import 'package:flutter/material.dart';

TextFormField buildTextFormField({
  required TextEditingController controller,
  required IconData icon,
  required String hint,
  required keyboardType,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    controller: controller,
    decoration: InputDecoration(
      icon: Icon(icon),
      border: const OutlineInputBorder(),
      hintText: hint,
    ),
  );
}
