import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double width;
  final double borderRadius;
  final double colorOpacity;

  const BlurContainer({
    super.key,
    required this.child,
    this.blur = 10,
    this.width = 300,
    this.borderRadius = 10,
    this.colorOpacity = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              child: Blur(
                blur: blur,
                blurColor: Colors.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                colorOpacity: colorOpacity,
                child: const SizedBox.expand(),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
