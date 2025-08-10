import 'package:flutter/material.dart';

class RCustomText extends StatelessWidget {
  const RCustomText(
    this.value, {
    super.key,
    this.maxLines,
    this.textAlign,
    this.fontSize,
    this.textColor,
    this.fontWeight,
  });

  final String value;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontSize: fontSize ?? 12,
        color: textColor ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
