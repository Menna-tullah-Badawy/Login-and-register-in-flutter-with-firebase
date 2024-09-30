// utils/custom_text_field.dart

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool? obscureText;
  final Function(String) onChanged;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.obscureText,
    required this.onChanged,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        fillColor: Color(0XFFF1F1F3),
        filled: true,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      onChanged: onChanged,
    );
  }
}
