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

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(250)),
        child: Drawer(
            width: MediaQuery.of(context).size.width / 1.7,
            child: Consumer<ThemeProvider>(builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    ListTile(
                      leading: PopupMenuButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String? value) {
                          provider.changeTheme(value ?? 'system');
                        },
                        itemBuilder: (context) => themes.map((e) {
                          return PopupMenuItem(
                              value: e,
                              child: CustomText(
                                text: e,
                              ));
                        }).toList(),
                      ),
                      title: const CustomText(text: 'Themes'),
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      onTap: () {
                        context.read<AuthenticationCubit>().signOut();
                      },
                      leading: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.logout,
                            size: 18,
                          )),
                      title: const CustomText(text: 'Log Out'),
                    ),
                  ],
                ),
              );
            })));
  }
}
