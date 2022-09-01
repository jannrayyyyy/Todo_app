import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/theme_provider.dart';
import '../custom/custom_text.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(250)),
        child: Drawer(
            child: Consumer<ThemeProvider>(builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: DropdownButton<String>(
                    value: provider.currentTheme,
                    icon: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.arrow_drop_down)),
                    iconSize: 42,
                    underline: const SizedBox(),
                    onChanged: (String? value) {
                      provider.changeTheme(value ?? 'system');
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'light',
                        child: CustomText(
                          text: 'Light Mode',
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'dark',
                        child: CustomText(
                          text: 'Dark Mode',
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'system',
                        child: CustomText(
                          text: 'System Theme',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      const CustomText(
                        text: 'Log Out',
                        size: 16,
                      ),
                      const SizedBox(width: 51),
                      Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.logout,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        })));
  }
}
