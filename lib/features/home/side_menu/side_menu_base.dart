import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tetsugym/features/home/providers/general_sections/aside_sections_provider.dart';
import 'package:tetsugym/routes/rkb_routes.dart';
import 'package:tetsugym/utils/material_colors.dart';

class SideMenuBase extends ConsumerWidget {
  const SideMenuBase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final watch = ref.watch(asideSectionsProvider);
    final read = ref.read(asideSectionsProvider.notifier);

    return Container(
      width: 60,
      height: size.height,
      color: RkColors.midnightBlack,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(
                CupertinoIcons.home,
                color: watch.imAlreadySelected(index: 0)
                    ? RkColors.blueDodger
                    : Colors.white,
              ),
              onPressed: () async {
                read.updateSectionsFilters(index: 0);
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: IconButton(
              icon: Icon(
                CupertinoIcons.settings,
                color: watch.imAlreadySelected(index: 1)
                    ? RkColors.blueDodger
                    : Colors.white,
              ),
              onPressed: () async {
                read.updateSectionsFilters(index: 1);
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              context.replaceNamed(RkbRoutes.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
