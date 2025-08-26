import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tetsugym/core/constants/rk_font_sizes.dart';
import 'package:tetsugym/core/shared_preferences/shared_preferences.dart';
import 'package:tetsugym/features/home/providers/general_sections/aside_sections_provider.dart';
import 'package:tetsugym/routes/rkb_routes.dart';
import 'package:tetsugym/utils/widgets/rk_inkwell.dart';

class SideMenuBase extends ConsumerStatefulWidget {
  const SideMenuBase({super.key});

  @override
  ConsumerState<SideMenuBase> createState() => _SideMenuBaseState();
}

class _SideMenuBaseState extends ConsumerState<SideMenuBase> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await _loadPrefs();
    });
  }

  Future<void> _loadPrefs() async {
    final preferences = SharedPreferencesService();
    final inMemory = preferences.getInt(PrefKeys.sideMenu) ?? 0;
    final read = ref.read(asideSectionsProvider.notifier);
    read.updateSectionsFilters(index: inMemory);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final watch = ref.watch(asideSectionsProvider);
    final read = ref.read(asideSectionsProvider.notifier);

    final preferences = SharedPreferencesService();

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: 60,
      height: size.height,
      decoration: BoxDecoration(
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
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 60,
              height: size.height,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 60,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SectionOption(
                    icon: CupertinoIcons.home,
                    withPading: true,
                    isSelected: watch.imAlreadySelected(index: 0),
                    voidCallback: () async {
                      await preferences.setInt(PrefKeys.sideMenu, 0);
                      read.updateSectionsFilters(index: 0);
                    },
                  ),
                ),
                SectionOption(
                  icon: Icons.notifications,
                  withPading: true,
                  voidCallback: () async {
                    await preferences.setInt(PrefKeys.sideMenu, 2);
                    read.updateSectionsFilters(index: 2);
                  },
                  isSelected: watch.imAlreadySelected(index: 2),
                ),
                SectionOption(
                  icon: Icons.wallet_outlined,
                  isSelected: watch.imAlreadySelected(index: 3),
                  withPading: true,
                  voidCallback: () async {
                    await preferences.setInt(PrefKeys.sideMenu, 3);
                    read.updateSectionsFilters(index: 3);
                  },
                ),
                SectionOption(
                  icon: Icons.group,
                  isSelected: watch.imAlreadySelected(index: 4),
                  withPading: true,
                  voidCallback: () async {
                    await preferences.setInt(PrefKeys.sideMenu, 4);
                    read.updateSectionsFilters(index: 4);
                  },
                ),
                SectionOption(
                  icon: Icons.inventory_2_outlined,
                  isSelected: watch.imAlreadySelected(index: 5),
                  withPading: true,
                  voidCallback: () async {
                    await preferences.setInt(PrefKeys.sideMenu, 5);
                    read.updateSectionsFilters(index: 5);
                  },
                ),
                SectionOption(
                  icon: Icons.account_balance_outlined,
                  isSelected: watch.imAlreadySelected(index: 6),
                  withPading: true,
                  voidCallback: () async {
                    await preferences.setInt(PrefKeys.sideMenu, 6);
                    read.updateSectionsFilters(index: 6);
                  },
                ),
                SectionOption(
                  icon: Icons.restaurant,
                  isSelected: watch.imAlreadySelected(index: 7),
                  withPading: true,
                  voidCallback: () async {
                    await preferences.setInt(PrefKeys.sideMenu, 7);
                    read.updateSectionsFilters(index: 7);
                  },
                ),
                SectionOption(
                  icon: Icons.fitness_center_outlined,
                  isSelected: watch.imAlreadySelected(index: 8),
                  withPading: true,
                  voidCallback: () async {
                    await preferences.setInt(PrefKeys.sideMenu, 8);
                    read.updateSectionsFilters(index: 8);
                  },
                ),
                SectionOption(
                  icon: CupertinoIcons.settings,
                  isSelected: watch.imAlreadySelected(index: 1),
                  withPading: true,
                  voidCallback: () async {
                    await preferences.setInt(PrefKeys.sideMenu, 1);
                    read.updateSectionsFilters(index: 1);
                  },
                ),

                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.black.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  // height: 50,
                  padding: EdgeInsets.only(
                    top: RkInsets.xs / 1.5,
                    bottom: RkInsets.xs,
                  ),
                  child: Center(
                    child: MenuAnchor(
                      alignmentOffset: Offset(55, -17),
                      style: MenuStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        surfaceTintColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                        elevation: WidgetStatePropertyAll(
                          8,
                        ), // sombra como un "Card"
                        shadowColor: WidgetStatePropertyAll(Colors.black54),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      builder: (context, controller, child) {
                        return RkInkwell(
                          onTap: () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://cdn.pixabay.com/photo/2018/01/03/19/54/fashion-3059143_960_720.jpg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      menuChildren: [
                        MenuItemButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                            overlayColor: WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.black,
                            ),
                          ),
                          leadingIcon: const Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          child: const Text('Cerrar sesión'),
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            context.replaceNamed(RkbRoutes.loginScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                /*SectionOption(
                  icon: Icons.logout,
                  withPading: true,
                  isRed: true,
                  voidCallback: () async {
                    
                  },
                ),*/
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
    this.isRed,
  });

  final IconData icon;
  final Function() voidCallback;
  final bool? isSelected;
  final bool withPading;
  final bool? isRed;

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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: isRed ?? false
                      ? Colors.red
                      : (isSelected == null)
                      ? Colors.grey.withValues(alpha: 0.5)
                      : isSelected!
                      ? Colors.black
                      : Colors.grey.withValues(alpha: 0.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
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
