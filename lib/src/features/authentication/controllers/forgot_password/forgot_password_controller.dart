import 'package:bill_split/src/data/authentication/authentication_repository.dart';
import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/loaders/loader.dart';
import 'package:bill_split/src/utils/logger/logger.dart';
import 'package:bill_split/src/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      TcFullScreenLoader.openLoadingDialog(
          'Processing your request...', TcImages.loadingDataImage);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TcFullScreenLoader.stopLoading();
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TcFullScreenLoader.stopLoading();
        return;
      }
      TcLoggerHelper.error("------>$email");
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      TcFullScreenLoader.stopLoading();

      TcLoaders.successSnackBar(
          title: 'Email Sent',
          message: "Email Link Sent to Resent your Password".tr);

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TcFullScreenLoader.stopLoading();
      TcLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TcFullScreenLoader.openLoadingDialog(
          'Processing your request...', TcImages.loadingDataImage);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TcFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);
      TcFullScreenLoader.stopLoading();

      TcLoaders.successSnackBar(
          title: 'Email Sent',
          message: "Email Link Sent to Resent your Password".tr);

      Get.to(() => ResetPasswordScreen(email: email));
    } catch (e) {
      TcFullScreenLoader.stopLoading();
      TcLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
