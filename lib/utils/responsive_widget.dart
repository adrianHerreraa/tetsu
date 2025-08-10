import 'package:flutter/material.dart';

enum ScreenSizeType { mobile, tablet, desktop, wideScreen }

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget wideScreen;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.wideScreen,
  });

  static ScreenSizeType getScreenSizeType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) return ScreenSizeType.mobile;
    if (width < 1024) return ScreenSizeType.tablet;
    if (width < 1440) return ScreenSizeType.desktop;
    return ScreenSizeType.wideScreen;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSizeType(context);

    switch (screenSize) {
      case ScreenSizeType.mobile:
        return mobile;
      case ScreenSizeType.tablet:
        return tablet;
      case ScreenSizeType.desktop:
        return desktop;
      case ScreenSizeType.wideScreen:
        return wideScreen;
    }
  }
}
