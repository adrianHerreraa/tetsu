import 'package:flutter/material.dart';
import 'package:tetsugym/core/constants/rk_font_sizes.dart';
import 'package:tetsugym/utils/material_colors.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    this.label,
    required this.controller,
    this.required = false,
    this.keyboardType = TextInputType.text,
    this.hint,
    this.validator,
    this.enabled,
    this.fontSize,
    this.isMandatory,
  });

  final String? label;
  final bool required;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? hint;
  final String? Function(String?)? validator;
  final bool? enabled;
  final double? fontSize;
  final bool? isMandatory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (required)
                  const TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        const SizedBox(height: 5),
        TextFormField(
          style: TextStyle(
            fontSize: fontSize ?? RkInsets.xs,
          ),
          enabled: enabled ?? true,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: '$hint ${isMandatory == true ? '*' : ''}',
            hintStyle: TextStyle(
              color: RkColors.blackColor.withValues(alpha: 0.3),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.grey, // color cuando está habilitado
                width: 1,
              ),
            ),
            isDense: true,
          ),
          validator:
              validator ??
              (required
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    }
                  : null),
        ),
      ],
    );
  }
}
