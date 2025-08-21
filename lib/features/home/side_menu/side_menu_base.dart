import 'package:blur/blur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:tetsugym/core/constants/rk_font_sizes.dart';
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
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          Blur(
            borderRadius: BorderRadius.circular(12),
            blur: 10,
            colorOpacity: .8,
            blurColor: Colors.white,
            child: SizedBox(
              width: 60,
              height: size.height,
            ),
          ),
          SizedBox(
            width: 60,
            height: size.height,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: RkColors.whiteColor.withValues(
                          alpha: 0.4,
                        ),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Center(
                    child: SectionOption(
                      icon: Symbols.arrow_menu_open,
                      withPading: false,
                      voidCallback: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SectionOption(
                    icon: CupertinoIcons.home,
                    withPading: true,
                    isSelected: watch.imAlreadySelected(index: 0),
                    voidCallback: () {
                      read.updateSectionsFilters(index: 0);
                    },
                  ),
                ),
                SectionOption(
                  icon: Icons.notifications,
                  withPading: true,
                  voidCallback: () {
                    read.updateSectionsFilters(index: 2);
                  },
                  isSelected: watch.imAlreadySelected(index: 2),
                ),
                SectionOption(
                  icon: Icons.wallet_outlined,
                  isSelected: watch.imAlreadySelected(index: 3),
                  withPading: true,
                  voidCallback: () {
                    read.updateSectionsFilters(index: 3);
                  },
                ),
                SectionOption(
                  icon: Icons.group,
                  isSelected: watch.imAlreadySelected(index: 4),
                  withPading: true,
                  voidCallback: () {
                    read.updateSectionsFilters(index: 4);
                  },
                ),
                SectionOption(
                  icon: Icons.inventory_2_outlined,
                  isSelected: watch.imAlreadySelected(index: 5),
                  withPading: true,
                  voidCallback: () {
                    read.updateSectionsFilters(index: 5);
                  },
                ),
                SectionOption(
                  icon: Icons.account_balance_outlined,
                  isSelected: watch.imAlreadySelected(index: 6),
                  withPading: true,
                  voidCallback: () {
                    read.updateSectionsFilters(index: 6);
                  },
                ),
                SectionOption(
                  icon: Icons.restaurant,
                  isSelected: watch.imAlreadySelected(index: 7),
                  withPading: true,
                  voidCallback: () {
                    read.updateSectionsFilters(index: 7);
                  },
                ),
                SectionOption(
                  icon: Icons.fitness_center_outlined,
                  isSelected: watch.imAlreadySelected(index: 8),
                  withPading: true,
                  voidCallback: () {
                    read.updateSectionsFilters(index: 8);
                  },
                ),
                SectionOption(
                  icon: CupertinoIcons.settings,
                  isSelected: watch.imAlreadySelected(index: 1),
                  withPading: true,
                  voidCallback: () {
                    read.updateSectionsFilters(index: 1);
                  },
                ),

                const Spacer(),
                SectionOption(
                  icon: Icons.logout,
                  withPading: true,
                  voidCallback: () async {
                    await FirebaseAuth.instance.signOut();
                    context.replaceNamed(RkbRoutes.loginScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionOption extends StatelessWidget {
  const SectionOption({
    super.key,
    required this.icon,
    required this.voidCallback,
    this.isSelected,
    required this.withPading,
  });

  final IconData icon;
  final Function() voidCallback;
  final bool? isSelected;
  final bool withPading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: withPading ? RkInsets.xs / 2 : 0,
      ),
      child: Container(
        color: Colors.transparent,
        width: 60,
        height: 35,
        child: Center(
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: (isSelected == null)
                      ? Colors.grey.withValues(alpha: 0.5)
                      : isSelected!
                      ? Colors.black
                      : Colors.grey.withValues(alpha: 0.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                  ),
                  child: Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      color: (isSelected == null)
                          ? Colors.transparent
                          : isSelected!
                          ? Colors.black
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () => voidCallback(),
          ),
        ),
      ),
    );
  }
}
