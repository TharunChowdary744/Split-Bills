// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// class HomeController extends GetxController {
//   final Rx<HomePageTab> selectedTab = HomePageTab.Friends.obs;
//
//   void changeTab(HomePageTab tab) {
//     selectedTab.value = tab;
//   }
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum HomePageTab { Friends, Groups, AddExpense, AllExpenses, Notes }

class HomeController extends GetxController {
  final PageController pageController = PageController();
  final TabController tabController = TabController(length: 5, vsync: Get.find());
  final Rx<HomePageTab> selectedTab = HomePageTab.Friends.obs;

  void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void changeTab(HomePageTab tab) {
    selectedTab.value = tab;
  }

  @override
  void onClose() {
    pageController.dispose();
    tabController.dispose();
    super.onClose();
  }

}
