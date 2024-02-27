import 'package:bill_split/src/features/authentication/screens/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage(){
    if(currentPageIndex.value ==2){
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.offAll( LoginPage());
    } else {
      int page = currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage(){
    if(currentPageIndex.value ==2){

      Get.offAll(LoginPage());
    } else {
      int page = currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }
}