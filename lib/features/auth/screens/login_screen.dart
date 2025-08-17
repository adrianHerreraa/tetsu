import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tetsugym/core/constants/rk_fonts.dart';
import 'package:tetsugym/core/constants/rkb_assets.dart';
import 'package:tetsugym/core/widgets/rounded_input.dart';
import 'package:tetsugym/domain/auth_service.dart';
import 'package:tetsugym/routes/rkb_routes.dart';
import 'package:tetsugym/utils/material_sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool? _error;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final user = await _authService.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (user != null && mounted) {
        context.replaceNamed(RkbRoutes.homeScreen);
      }
    } on FirebaseAuthException {
      setState(() {
        _error = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.purple,
            child: Image.asset(
              RkbAssets.backgroundLogginOne,
              fit: BoxFit.cover,
            ),
          ),
          Blur(
            blur: 1,
            blurColor: Colors.black.withValues(alpha: 0.1),
            child: SizedBox(
              width: size.width,
              height: size.height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 50,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: (size.width / 2) - 200,
                height: size.height - 200,
                child: Stack(
                  children: [
                    Blur(
                      borderRadius: BorderRadius.circular(20),
                      blur: 10,
                      colorOpacity: 0.8,
                      blurColor: Colors.white,
                      child: SizedBox(
                        width: (size.width / 2) - 200,
                        height: size.height - 100,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: (size.width / 2) - 200,
                      height: size.height - 100,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Flexible(
                                flex: 3,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://cdn.pixabay.com/photo/2025/08/01/15/06/pixel-art-9748845_1280.png',
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 7,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: AppSizes.large,
                                      ),
                                      Text(
                                        'Log in',
                                        style: TextStyle(
                                          fontFamily: RkFonts.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: AppSizes.xLarge,
                                        ),
                                        child: RoundedInput(
                                          controller: _emailController,
                                          suffixIcon: CupertinoIcons.person,
                                          hintText: 'Username or email',
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: AppSizes.medium,
                                        ),
                                        child: RoundedInput(
                                          isSecureText: true,
                                          hintText: 'Password',
                                          controller: _passwordController,
                                          suffixIcon: CupertinoIcons.lock,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: AppSizes.medium,
                                        ),
                                        child: SizedBox(
                                          width: 400,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () {},
                                                child: Text(
                                                  'Forgot password?',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: RkFonts.regular,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: AppSizes.xxxLarge,
                                        ),
                                        child: InkWell(
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: _isLoading
                                              ? () {}
                                              : () async {
                                                  await _login();
                                                },
                                          child: Container(
                                            width: 400,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    10,
                                                  ),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                            ),
                                            child: Center(
                                              child: _isLoading
                                                  ? const SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )
                                                  : const Text(
                                                      'Log in',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            RkFonts.semiBold,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_error != null)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: AppSizes.medium,
                                          ),
                                          child: InkWell(
                                            hoverColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: _isLoading
                                                ? () {}
                                                : () async {
                                                    await _login();
                                                  },
                                            child: const Text(
                                              'Upps! We have an error\nemail or password are wrong!',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: RkFonts.regular,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {},
                                            child: Text(
                                              'Terms of use',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: RkFonts.regular,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Text('|'),
                                          ),
                                          InkWell(
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {},
                                            child: Text(
                                              'Privacy policy',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: RkFonts.regular,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
