import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/helpers/network_manager.dart';
import 'package:bill_split/src/utils/loaders/loader.dart';
import 'package:bill_split/src/utils/popups/full_screen_loader.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../sdk/functions/messaging_functions.dart';
import '../../../../data/authentication/authentication_repository.dart';
import '../../../../data/user/user_repository.dart';
import '../../../personalization/modals/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  // final firstName = TextEditingController();
  // final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final userRepo = Get.put(UserRepository());
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void registerUser() async {
    try {
      //start Loading
      TcFullScreenLoader.openLoadingDialog('We are processing your information...', TcImages.loadingDataImage);

      //Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) return;

      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TcFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy check
      if (!privacyPolicy.value) {
        TcLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        TcFullScreenLoader.stopLoading();
        return;
      }
      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      await FirebaseAnalytics.instance.logSignUp(signUpMethod: "email_pass");
      NotificationHandler().configureFcm(Get.context!);

      //Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        // firstName: firstName.text.trim(),
        // lastName: lastName.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        profilePicture: '',
        phoneNumber: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
      TcFullScreenLoader.stopLoading();
      TcLoaders.successSnackBar(title: 'Congratulatons', message: 'Your account has been created! Verify email to continue.');

      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));

      // Show success Message
    } catch (e) {
      TcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      TcFullScreenLoader.stopLoading();
    }
    // finally {
    //   TcFullScreenLoader.stopLoading();
    // }
  }

// Future<void> createUser(UserModel user) async {
//   await userRepo.createUser(user);
// }
}
