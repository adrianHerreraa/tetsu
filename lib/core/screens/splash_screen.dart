import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tetsugym/core/constants/rkb_assets.dart';
import 'package:tetsugym/routes/rkb_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () async {
      if (mounted) {
        context.replaceNamed(RkbRoutes.loginScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Lottie.asset(
            RkbAssets.lottieLoadingOne,
            fit: BoxFit.contain,
            width: 600,
            height: 600,
            backgroundLoading: true,
          ),
        ),
      ),
    );
  }
}
