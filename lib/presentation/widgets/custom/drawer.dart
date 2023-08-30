import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/presentation/cubit/authentication/authentication_cubit.dart';

import '../../../core/theme/theme_provider.dart';
import '../components/custom_text.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<String> themes = ['light', 'dark', 'system'];
  bool isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
      ),
      child: Drawer(
        child: Consumer<ThemeProvider>(
          builder: (context, provider, child) {
            provider.currentTheme == "dark"
                ? isDarkMode = true
                : isDarkMode = false;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 34,
                        backgroundImage: AssetImage('assets/utils/me4.png'),
                      ),
                      SizedBox(width: 12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Good Afternoon,',
                          ),
                          CustomText(
                            text: 'Jannray!',
                            weight: FontWeight.w600,
                            size: 18,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
                  rowBuilder(
                    label: 'Profile',
                    icon: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.person_3,
                        color: provider.currentTheme == "dark"
                            ? Colors.blue
                            : Colors.purple.shade200,
                      ),
                    ),
                    provider: provider,
                  ),
                  const SizedBox(height: 12),
                  rowBuilder(
                    label: 'History',
                    icon: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.receipt,
                        color: provider.currentTheme == "dark"
                            ? Colors.blue
                            : Colors.purple.shade200,
                      ),
                    ),
                    provider: provider,
                  ),
                  const SizedBox(height: 12),
                  rowBuilder(
                    label: provider.currentTheme == "dark"
                        ? 'Dark Mode'
                        : 'Light Mode',
                    icon: Switch(
                        value: isDarkMode,
                        onChanged: (v) {
                          isDarkMode = v;
                          if (isDarkMode) {
                            provider.changeTheme("dark");
                          } else {
                            provider.changeTheme("light");
                          }
                        }),
                    // icon:  PopupMenuButton(
                    //   padding: const EdgeInsets.all(0),
                    //   icon: const Icon(Icons.arrow_drop_down),
                    //   onSelected: (String? value) {
                    //     provider.changeTheme(value ?? 'system');
                    //   },
                    //   itemBuilder: (context) => themes.map((e) {
                    //     return PopupMenuItem(
                    //         value: e,
                    //         child: CustomText(
                    //           text: e,
                    //         ));
                    //   }).toList(),
                    // ),
                    provider: provider,
                  ),
                  const SizedBox(height: 12),
                  rowBuilder(
                    label: 'Setings',
                    icon: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.settings,
                        color: provider.currentTheme == "dark"
                            ? Colors.blue
                            : Colors.purple.shade200,
                      ),
                    ),
                    provider: provider,
                  ),
                  const Spacer(),
                  rowBuilder(
                    label: 'Log Out',
                    icon: GestureDetector(
                      onTap: () {
                        context.read<AuthenticationCubit>().signOut();
                      },
                      child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.logout,
                          color: provider.currentTheme == "dark"
                              ? Colors.blue
                              : Colors.purple.shade200,
                        ),
                      ),
                    ),
                    provider: provider,
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget rowBuilder({
  required String label,
  required Widget icon,
  required ThemeProvider provider,
}) {
  return Container(
    decoration: BoxDecoration(
      color: provider.currentTheme == "dark"
          ? Colors.white10
          : Colors.grey.shade200,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: CustomText(
            text: label,
            weight: FontWeight.w500,
          ),
        ),
        icon
      ],
    ),
  );
}
