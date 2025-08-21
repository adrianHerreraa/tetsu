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
      backgroundColor: Colors.grey.withValues(alpha: 0.1),
      body: Stack(
        children: [
          // const Header(),
          Container(
            color: Colors.white,
          ),
          Positioned.fill(
            left: 80,
            child: ManagePagesWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
              bottom: 10,
            ),
            child: Positioned.fill(
              child: SideMenuBase(),
            ),
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
        return const SettingsPage();
      default:
        return const SizedBox();
    }
  }
}
