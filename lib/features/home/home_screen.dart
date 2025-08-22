import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetsugym/features/home/dashboard/dashboard_screen.dart';
// import 'package:tetsugym/features/home/header/header.dart';
import 'package:tetsugym/features/home/providers/general_sections/aside_sections_provider.dart';
import 'package:tetsugym/features/home/side_menu/side_menu_base.dart';
import 'package:tetsugym/features/settings/settings_page.dart';
// import 'package:tetsugym/utils/material_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 100,
            right: 0,
            top: 0,
            bottom: 0,
            child: ManagePagesWidget(),
          ),
          Positioned(
            top: 10,
            bottom: 10,
            left: 10,
            child: SideMenuBase(),
          ),
        ],
      ),
    );
  }
}

class ManagePagesWidget extends ConsumerWidget {
  const ManagePagesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getSectionSelected = ref
        .watch(asideSectionsProvider)
        .getSectionSelected;

    switch (getSectionSelected.index) {
      case 0:
        return const DashboardScreen();
      case 1:
        return FadeIn(
          child: const SettingsPage(),
        );
      case 2:
        return const Center(child: Text('2'));
      case 3:
        return const Center(child: Text('3'));
      case 4:
        return const Center(child: Text('4'));
      case 5:
        return const Center(child: Text('5'));
      case 6:
        return const Center(child: Text('6'));
      case 7:
        return const Center(child: Text('7'));
      case 8:
        return const Center(child: Text('8'));
      case 9:
        return const Center(child: Text('9'));
      case 10:
        return const Center(child: Text('10'));
      default:
        return const SizedBox();
    }
  }
}
