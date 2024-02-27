import 'package:bill_split/src/common/form_fields/custom_form_field.dart';
import 'package:bill_split/src/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/constants/sizes.dart';
import 'package:bill_split/src/utils/constants/text_strings.dart';
import 'package:bill_split/src/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/validators/validators.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: ()=>Get.back(), icon: Icon(CupertinoIcons.clear))],
      ),
      body: Padding(
        padding: EdgeInsets.all(TcSizes.defaultSpace),
        child: Column(
          children: [

            /// change image
            Text(TcTexts.forgotPasswordTitle, style: Theme
                .of(context)
                .textTheme
                .headlineMedium, textAlign: TextAlign.center,),
            SizedBox(height: TcSizes.spaceBtwSections,),
            Text(TcTexts.forgotPasswordSubTitle, style: Theme
                .of(context)
                .textTheme
                .labelMedium, textAlign: TextAlign.center,),
            SizedBox(height: TcSizes.spaceBtwSections,),
            Form(
              key: controller.forgetPasswordFormKey,
              child: CustomTextFormField(
                currentNode: FocusNode(),
                nextNode: FocusNode(),
                textInputAction: TextInputAction.next,
                maxLines: 1,
                fieldController: controller.email,
                hintText: TcTexts.email,
                prefixImage: TcImages.textFieldMail,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => TcValidator.validateEmail(value!),
                obscureText: false,
              ),
            ),
            SizedBox(height: TcSizes.spaceBtwSections,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(),child: Text(TcTexts.submit),),
            )
          ],
        ),
      ),
    );
  }
}
