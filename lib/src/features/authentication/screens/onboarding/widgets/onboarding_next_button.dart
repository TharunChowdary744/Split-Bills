import 'package:bill_split/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = TcHelperFunctions.isDarkMode(context);

    return Positioned(
        right: TcSizes.defaultSpace,
        bottom: TcDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: ()=>OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: dark? TcColors.primary:Colors.black),
          child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
        ));
  }
}
