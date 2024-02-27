import 'package:bill_split/src/utils/loaders/loader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/controllers/user_controller.dart';
import '../../../personalization/modals/user_model.dart';

class LoginController extends GetxController {
  // static LoginController get instance => Get.find();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // email.text = localStorage.read('REMEMBER_ME_EMAIL');
    // password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      //start Loading
      TcFullScreenLoader.openLoadingDialog(
          'Logging you in...', TcImages.loadingDataImage);

      //Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TcFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TcFullScreenLoader.stopLoading();
        return;
      }
      // Privacy Policy check
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      // login user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      TcFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    }

    // Show success Message
    catch (e) {
      TcFullScreenLoader.stopLoading();
      TcLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleLogin() async {
    try {
      TcFullScreenLoader.openLoadingDialog(
          'Logging you in...', TcImages.loadingDataImage);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TcFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      TcFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TcFullScreenLoader.stopLoading();
      TcLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
