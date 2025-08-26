import 'package:flutter/material.dart';

class RkInkwell extends StatelessWidget {
  const RkInkwell({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: child,
      onTap: () => onTap(),
    );
  }
}
