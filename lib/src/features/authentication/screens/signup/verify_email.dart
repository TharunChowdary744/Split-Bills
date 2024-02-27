import 'package:bill_split/src/data/authentication/authentication_repository.dart';
import 'package:bill_split/src/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:bill_split/src/features/authentication/screens/login/login_page.dart';
import 'package:bill_split/src/features/authentication/screens/signup/success_screen.dart';
import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/constants/sizes.dart';
import 'package:bill_split/src/utils/constants/text_strings.dart';
import 'package:bill_split/src/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/blueButton.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TcSizes.defaultSpace), // 30
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(TcImages.deliveryverifyIllustration),
                width: TcHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TcSizes.spaceBtwSections), // 40

              Text(TcTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TcSizes.spaceBtwItems),
              Text(email??'',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: TcSizes.spaceBtwItems),
              Text(TcTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TcSizes.spaceBtwSections),
              BlueButton(
                title: TcTexts.tcContinue,
                onPressed: () => controller.checkEmailVerificationStatus(),
              ),
              const SizedBox(height: TcSizes.spaceBtwItems), // 45
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: ()=>controller.sendEmailVerification(),
                  child: Text(TcTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
