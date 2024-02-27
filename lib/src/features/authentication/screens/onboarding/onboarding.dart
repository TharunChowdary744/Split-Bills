import 'package:bill_split/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:bill_split/src/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:bill_split/src/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:bill_split/src/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:bill_split/src/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:bill_split/src/utils/constants/colors.dart';
import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/constants/sizes.dart';
import 'package:bill_split/src/utils/constants/text_strings.dart';
import 'package:bill_split/src/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller:controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TcImages.onBoardingImage1,
                title: TcTexts.onBoardingTitle1,
                subTitle: TcTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TcImages.onBoardingImage2,
                title: TcTexts.onBoardingTitle2,
                subTitle: TcTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TcImages.onBoardingImage3,
                title: TcTexts.onBoardingTitle3,
                subTitle: TcTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

