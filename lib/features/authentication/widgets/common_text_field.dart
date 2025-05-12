import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  const CommonTextField({
    super.key,
    required this.label,
    this.hintText,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText ?? 'Enter your $label',
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon:
            suffixIcon != null
                ? GestureDetector(onTap: onSuffixTap, child: Icon(suffixIcon))
                : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF0F5F52), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
