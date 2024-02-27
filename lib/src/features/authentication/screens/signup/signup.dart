import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/constants/sizes.dart';
import 'package:bill_split/src/utils/constants/text_strings.dart';
import 'package:bill_split/src/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/widgets/blueButton.dart';
import '../../../../common/form_fields/custom_form_field.dart';
import '../../../../utils/utils.dart';
import '../../../../common/googleButton.dart';
import '../../controllers/login/login_controller.dart';
import '../../controllers/signup/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _emailNode = FocusNode();
    final _passwordNode = FocusNode();
    final _firstNameNode = FocusNode();
    final _lastNameNode = FocusNode();

    void _onSignInPressed() {
      Navigator.of(context).pushReplacementNamed('/login');
    }

    final controller = Get.put(SignUpController());
    final loginController = Get.put(LoginController());
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
                    TcTexts.signUpHeading,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: screenHeight * 0.035, //38
                        ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.036689962, //33
                  ),
                  Form(
                    key: controller.signupFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: CustomTextFormField(
                        //           fieldController: controller.firstName,
                        //           hintText: TcTexts.firstName,
                        //           prefixImage: TcImages.textFieldName,
                        //           keyboardType: TextInputType.text,
                        //           currentNode: _firstNameNode,
                        //           textInputAction: TextInputAction.next,
                        //           validator: (value) => TcValidator.validateName(
                        //               value!, 'First Name'),
                        //           maxLines: 1),
                        //     ),
                        //     SizedBox(width: TcSizes.spaceBtwItems-10,),
                        //     Expanded(
                        //       child: CustomTextFormField(
                        //           fieldController: controller.lastName,
                        //           hintText: TcTexts.lastName,
                        //           prefixImage: TcImages.textFieldName,
                        //           keyboardType: TextInputType.text,
                        //           currentNode: _lastNameNode,
                        //           textInputAction: TextInputAction.next,
                        //           validator: (value) =>
                        //               TcValidator.validateName(value!, 'Last Name'),
                        //           maxLines: 1),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(height: TcSizes.spaceBtwItems-3),
                        CustomTextFormField(
                          currentNode: _emailNode,
                          nextNode: _passwordNode,
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          fieldController: controller.email,
                          hintText: TcTexts.email,
                          prefixImage: TcImages.textFieldMail,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => TcValidator.validateEmail(value!),
                          obscureText: false,
                        ),
                        SizedBox(height: TcSizes.spaceBtwItems-3),
                        Obx(
                          () => CustomTextFormField(
                            currentNode: _passwordNode,
                            textInputAction: TextInputAction.done,
                            maxLines: 1,
                            fieldController: controller.password,
                            hintText: TcTexts.password,
                            prefixImage: TcImages.textFieldPassword,
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
                        // SizedBox(height: screenHeight * 0.061149936), // 55
                        SizedBox(height: screenHeight * 0.024459975), // 22
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller.privacyPolicy.value,
                                onChanged: (value) => controller.privacyPolicy
                                    .value = !controller.privacyPolicy.value,
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                            Text(
                              "I accept ",
                              style:
                                  Theme.of(context).textTheme.displaySmall?.copyWith(
                                        fontSize: screenHeight * 0.01111817, // 10
                                      ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                launch("https://contr.app");
                              },
                              child: Text(
                                "Terms and Conditions",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: screenHeight * 0.01111817, // 10
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.024459975), // 22
                        BlueButton(
                            title: "Sign Up",
                            onPressed: () => controller.registerUser()),
                      ],
                    ),
                  ),
                  SizedBox(height: TcSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "or register with",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: screenHeight * 0.01111817, // 10
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: TcSizes.spaceBtwSections),
                  GoogleButton(
                    title: "Sign Up with Google",
                    onPressed: () {
                      loginController.googleLogin();
                    },
                  ),
                  SizedBox(height: TcSizes.spaceBtwSections),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              fontSize: screenHeight * 0.01111817, // 10
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      GestureDetector(
                        onTap: _onSignInPressed,
                        child: Text(
                          "Sign In",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: screenHeight * 0.01111817, // 10
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
