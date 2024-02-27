import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/constants/sizes.dart';
import 'package:bill_split/src/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common/widgets/blueButton.dart';
import '../../../../common/forgotPasswordDialog.dart';
import '../../../../common/form_fields/custom_form_field.dart';
import '../../../../common/googleButton.dart';
import '../../../../utils/utils.dart';
import '../../../../utils/validators/validators.dart';
import '../../controllers/login/login_controller.dart';
import '../password_configuration/forgot_password.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _onSignUpPressed() {
      Navigator.of(context).pushReplacementNamed("/registration");
    }

    final _emailNode = FocusNode();
    final _passwordNode = FocusNode();

    final controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.142312579, // 128
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.072916667), // 30
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: screenHeight * 0.042249047, //38
                        ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.036689962, //33
                  ),
                  Form(
                    key: controller.loginFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextFormField(
                          currentNode: _emailNode,
                          nextNode: _passwordNode,
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          fieldController: controller.email,
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
                            fieldController: controller.password,
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
                        const SizedBox(height: TcSizes.spaceBtwInputFields / 2),
                        // 22
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Obx(() => Checkbox(
                                    value: controller.rememberMe.value,
                                    onChanged: (value) =>
                                        controller.rememberMe.value =value ?? false
                                        /*!controller.rememberMe.value*/)),
                                const Text(TcTexts.rememberMe),
                              ],
                            ),
                            TextButton(
                                onPressed: ()=>Get.to(ForgotPassword()),
                                child: Text(TcTexts.forgotPassword)),
                          ],
                        ),
        
                        SizedBox(height: TcSizes.spaceBtwSections),
                        // 22
                        BlueButton(
                            title: TcTexts.signUp,
                            onPressed: () => controller.emailAndPasswordSignIn()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.053367217, // 48
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "or connect with",
                        style:
                            Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontSize: screenHeight * 0.01111817, // 10
                                ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.053367217, // 48
                  ),
                  GoogleButton(
                      title: "Continue with Google",
                      onPressed: () =>controller.googleLogin(),
                      ),
                  SizedBox(height: screenHeight * 0.180462516), // 183
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: screenHeight * 0.01111817, // 10
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      GestureDetector(
                        onTap: _onSignUpPressed,
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: screenHeight * 0.01111817, // 10
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
