import 'package:bill_split/src/data/user/user_repository.dart';
import 'package:bill_split/src/features/personalization/controllers/user_controller.dart';
import 'package:bill_split/src/features/personalization/screens/profile/profile.dart';
import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/logger/logger.dart';
import 'package:bill_split/src/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/network_manager.dart';
import '../../../utils/loaders/loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    // firstName.text = userController.user.value.firstName;
    // lastName.text = userController.user.value.lastName;
    TcLoggerHelper.error("${firstName.text+lastName.text}");
  }

  Future<void> updateUserName() async {
    try {
      //start Loading
      TcFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TcImages.loadingDataImage);

      //Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) return;

      //Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TcFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // userController.user.value.firstName = firstName.text.trim();
      // userController.user.value.lastName = lastName.text.trim();

      TcFullScreenLoader.stopLoading();

      TcLoaders.successSnackBar(
          title: 'Congratulatons', message: 'Your Name has been updated.');

      // Get.off(() => ProfileScreen());
      Navigator.of(Get.overlayContext!).pop();
      // Show success Message
    } catch (e) {
      TcFullScreenLoader.stopLoading();
      TcLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
