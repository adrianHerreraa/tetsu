import 'package:flutter/material.dart';
import 'package:tetsugym/utils/material_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      color: RkColors.whiteColor,
      child: const Center(
        child: Text(
          'System Operator (Luis Adrian) - Active profile - CRUD',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
