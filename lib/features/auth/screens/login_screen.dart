import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tetsugym/core/widgets/rounded_input.dart';
import 'package:tetsugym/routes/rkb_routes.dart';
import 'package:tetsugym/utils/blurred_container.dart';
import 'package:tetsugym/utils/material_colors.dart';
import 'package:tetsugym/utils/material_sizes.dart';
import 'package:tetsugym/utils/r_custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _error;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Login exitoso, navega a home o donde quieras

      if (mounted) {
        context.replaceNamed(RkbRoutes.homeScreen);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _error = e.message;
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
    return Scaffold(
      backgroundColor: RkColors.steelBlue,
      body: Center(
        child: BlurContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.small,
              vertical: AppSizes.small,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_error != null) ...[
                  Text(_error!, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 8),
                ],
                const RCustomText(
                  'Login',
                  fontSize: AppSizes.xLarge,
                  textColor: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.medium),
                  child: RoundedInput(
                    controller: _emailController,
                    suffixIcon: CupertinoIcons.person,
                    hintText: 'Username or email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.medium),
                  child: RoundedInput(
                    isSecureText: true,
                    hintText: 'Password',
                    controller: _passwordController,
                    suffixIcon: CupertinoIcons.lock,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.medium),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: _isLoading
                        ? () {}
                        : () {
                            _login();
                          },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Center(
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
