import 'dart:async';

import 'package:bill_split/src/utils/constants/text_strings.dart';
import 'package:bill_split/src/utils/loaders/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../screens/login/login_page.dart';
import '../../screens/signup/success_screen.dart';


class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TcLoaders.successSnackBar(
          title: 'Email Sent',
          message: TcTexts.emailSentText);
    } catch (e) {
      TcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(()=>SuccessScreen(
          image: TcImages.successfullyRegisterAnimation,
          title: TcTexts.yourAccountCreatedTitle,
          subTitle: TcTexts.yourAccountCreatedSubTitle,
          onPressed: () =>  AuthenticationRepository.instance.screenRedirect(),
        ));
      }
    });
  }

  checkEmailVerificationStatus() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if(currentUser != null && currentUser.emailVerified){
        Get.off(()=>SuccessScreen(
          image: TcImages.successfullyRegisterAnimation,
          title: TcTexts.yourAccountCreatedTitle,
          subTitle: TcTexts.yourAccountCreatedSubTitle,
          onPressed: () =>  AuthenticationRepository.instance.screenRedirect(),
        ));
      }
    } catch (e) {
      TcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
