import 'package:bill_split/src/features/moneytracker/screens/home/home.dart';
import 'package:bill_split/src/features/personalization/screens/settings/settings.dart';
import 'package:bill_split/src/utils/constants/colors.dart';
import 'package:bill_split/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = TcHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TcColors.black : TcColors.white,
          indicatorColor: darkMode
              ? TcColors.white.withOpacity(0.1)
              : TcColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home_hashtag),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.category_2),
              label: 'Categories',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.candle),
              label: 'Analytics',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.deepPurple,
    ),
    SettingsScreen(),
  ];
}
