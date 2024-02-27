import 'package:bill_split/src/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:bill_split/src/features/authentication/screens/login/login_page.dart';
import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/constants/sizes.dart';
import 'package:bill_split/src/utils/constants/text_strings.dart';
import 'package:bill_split/src/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email}) ;

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: ()=>Get.back(), icon: Icon(CupertinoIcons.clear))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TcSizes.defaultSpace),
          child: Column(
            children: [
              /// change image

              Image(image: AssetImage(TcImages.deliveryverifyIllustration), width: TcHelperFunctions.screenWidth()*0.6,),
              SizedBox(height: TcSizes.spaceBtwSections,),
              Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
              SizedBox(height: TcSizes.spaceBtwSections,),
              Text(TcTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: TcSizes.spaceBtwSections,),
              Text(TcTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              SizedBox(height: TcSizes.spaceBtwSections,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=>Get.offAll(LoginPage()),child: Text(TcTexts.done),),
              ),
              SizedBox(height: TcSizes.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=>ForgotPasswordController.instance.resendPasswordResetEmail(email),child: Text(TcTexts.resendEmail),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
