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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: watch.imAlreadySelected(index: 2)
                    ? RkColors.blueDodger
                    : Colors.white,
              ),
              onPressed: () async {
                read.updateSectionsFilters(index: 2);
              },
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(
                Icons.wallet_outlined,
                color: watch.imAlreadySelected(index: 3)
                    ? RkColors.blueDodger
                    : Colors.white,
              ),
              onPressed: () async {
                read.updateSectionsFilters(index: 3);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(
                Icons.group,
                color: watch.imAlreadySelected(index: 4)
                    ? RkColors.blueDodger
                    : Colors.white,
              ),
              onPressed: () async {
                read.updateSectionsFilters(index: 4);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(
                Icons.inventory_2_outlined,
                color: watch.imAlreadySelected(index: 5)
                    ? RkColors.blueDodger
                    : Colors.white,
              ),
              onPressed: () async {
                read.updateSectionsFilters(index: 5);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(
                Icons.account_balance_outlined,
                color: watch.imAlreadySelected(index: 6)
                    ? RkColors.blueDodger
                    : Colors.white,
              ),
              onPressed: () async {
                read.updateSectionsFilters(index: 6);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(
                Icons.restaurant,
                color: watch.imAlreadySelected(index: 7)
                    ? RkColors.blueDodger
                    : Colors.white,
              ),
              onPressed: () async {
                read.updateSectionsFilters(index: 7);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              icon: Icon(
                Icons.fitness_center_outlined,
                color: watch.imAlreadySelected(index: 8)
                    ? RkColors.blueDodger
                    : Colors.white,
              ),
              onPressed: () async {
                read.updateSectionsFilters(index: 8);
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
