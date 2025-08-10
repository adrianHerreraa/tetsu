import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tetsugym/features/home/dashboard/dashboard_screen.dart';
import 'package:tetsugym/features/home/header/header.dart';
import 'package:tetsugym/features/home/providers/general_sections/aside_sections_provider.dart';
import 'package:tetsugym/features/home/side_menu/side_menu_base.dart';
import 'package:tetsugym/features/settings/settings_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: Row(
              children: [
                const SideMenuBase(),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.grey.withValues(alpha: 0.1),
                    child: const ManagePagesWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    /*return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              context.replaceNamed(RkbRoutes.loginScreen);
            },
          ),
        ],
      ),
      body: Center(child: Text('Bienvenido, ${user?.email ?? 'usuario'}')),
    );*/
  }
}

class ManagePagesWidget extends ConsumerWidget {
  const ManagePagesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getSectionSelected = ref.watch(asideSectionsProvider).getSectionSelected;

    switch(getSectionSelected.index){
      case 0:
      return const DashboardScreen();
      case 1:
      return const SettingsPage();
      default:
      return const SizedBox();
    }
  }
}