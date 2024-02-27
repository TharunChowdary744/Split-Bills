import 'package:bill_split/src/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/form_fields/custom_form_field.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/utils.dart';
import '../../../../utils/validators/validators.dart';
import '../../../personalization/controllers/update_name_controller.dart';


class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailNode = FocusNode();
    final _passwordNode = FocusNode();
    final controller = UserController.instance;
    return Scaffold(
      appBar: TcAppBar(
        showBackArrow: true,
        title: Text(
          'Re-Authenticate User',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TcSizes.defaultSpace),
        child: Column(
          children: [
            // Text(
            //   'Use real name for easy verification , This name will appear on several pages',
            //   style: Theme.of(context).textTheme.labelMedium,
            // ),
            // SizedBox(height: TcSizes.spaceBtwSections,),
            Form(
                key: controller.reAuthFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      currentNode: _emailNode,
                      nextNode: _passwordNode,
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      fieldController: controller.verifyEmail,
                      hintText: TcTexts.email,
                      prefixImage: TcImages.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => TcValidator.validateEmail(value!),
                    ),
                    const SizedBox(height: TcSizes.spaceBtwInputFields),
                    // 22
                    Obx(
                          () => CustomTextFormField(
                        currentNode: _passwordNode,
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        fieldController: controller.verifyPassword,
                        hintText: TcTexts.password,
                        prefixImage: TcImages.password,
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            TcValidator.validatePassword(value!),
                        obscureText: controller.hidePassword.value,
                        suffix: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              controller.hidePassword.value
                                  ? TcImages.visibilityOff
                                  : TcImages.visibilityOn,
                              color: Theme.of(context).primaryColor,
                              height: screenHeight * 0.024471635,
                              width: screenHeight * 0.024471635,
                            ),
                            onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: TcSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                child: Text('Verify'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
