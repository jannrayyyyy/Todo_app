import 'package:flutter/material.dart';

import '../widgets/components/drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), endDrawer: const CustomDrawer(), body: Container());
  }
}
