import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimatedPageTransition {
  
  CustomTransitionPage animatedPage(
    GoRouterState state,
    Widget child, {
    Widget Function(Widget)? animation,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: animation != null
          ? animation(child)
          : FadeIn(duration: const Duration(milliseconds: 600), child: child),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
