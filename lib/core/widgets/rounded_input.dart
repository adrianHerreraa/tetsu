import 'package:flutter/material.dart';
import 'package:tetsugym/core/constants/rk_fonts.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    super.key,
    required this.controller,
    required this.suffixIcon,
    required this.hintText,
    this.maxLength,
    this.isSecureText,
    this.fill,
    this.suffixIconColor,
  });

  final TextEditingController controller;
  final IconData suffixIcon;
  final String hintText;
  final int? maxLength;
  final bool? isSecureText;
  final double? fill;
  final Color? suffixIconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextField(
        maxLength: maxLength ?? 25,
        controller: controller,
        obscureText: isSecureText ?? false,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontFamily: RkFonts.regular,
          ),
          filled: true,
          fillColor: Colors.white.withValues(alpha: fill ?? 0.9),
          suffixIcon: Icon(
            suffixIcon,
            color: suffixIconColor ?? Colors.black,
            size: 20,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
