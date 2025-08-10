import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:tetsugym/core/screens/splash_screen.dart';
import 'package:tetsugym/features/auth/screens/login_screen.dart';
import 'package:tetsugym/features/home/home_screen.dart';
import 'package:tetsugym/routes/rkb_routes.dart';
import 'package:tetsugym/utils/animated_page_transition.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: RkbRoutes.splashScreen,
      path: RkbRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: RkbRoutes.loginScreen,
      path: RkbRoutes.loginScreen,
      pageBuilder: (context, state) => AnimatedPageTransition().animatedPage(
        state,
        const LoginScreen(),
        animation: (child) =>
            FadeIn(duration: const Duration(milliseconds: 500), child: child),
      ),
    ),
    GoRoute(
      name: RkbRoutes.homeScreen,
      path: RkbRoutes.homeScreen,
      pageBuilder: (context, state) => AnimatedPageTransition().animatedPage(
        state,
        const HomeScreen(),
        animation: (child) =>
            FadeIn(duration: const Duration(milliseconds: 500), child: child),
      ),
    ),
  ],
);
