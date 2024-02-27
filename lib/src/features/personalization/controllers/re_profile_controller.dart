import 'dart:math';

import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/helpers/network_manager.dart';
import 'package:bill_split/src/utils/loaders/loader.dart';
import 'package:bill_split/src/utils/popups/full_screen_loader.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../sdk/functions/messaging_functions.dart';
import '../../../constants/storage_constants.dart';
import '../../../data/authentication/authentication_repository.dart';
import '../../../data/user/user_repository.dart';
import '../../authentication/screens/signup/verify_email.dart';
import '../modals/user_model.dart';

class ProfileRegPageController extends GetxController {
  static ProfileRegPageController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final currencyController = TextEditingController(text: "INR");
  final photoUrlController = TextEditingController(
    text: userAvatars[Random().nextInt(userAvatars.length)],
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



}
