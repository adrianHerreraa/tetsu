import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tetsugym/core/widgets/rounded_input.dart';
import 'package:tetsugym/utils/blurred_container.dart';
import 'package:tetsugym/utils/material_colors.dart';
import 'package:tetsugym/utils/material_sizes.dart';
import 'package:tetsugym/utils/r_custom_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                RCustomText(
                  'Login',
                  fontSize: AppSizes.xLarge,
                  textColor: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.medium),
                  child: RoundedInput(
                    controller: TextEditingController(),
                    suffixIcon: CupertinoIcons.person,
                    hintText: 'Username or email',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.medium),
                  child: RoundedInput(
                    hintText: 'Password',
                    controller: TextEditingController(),
                    suffixIcon: CupertinoIcons.lock,
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
