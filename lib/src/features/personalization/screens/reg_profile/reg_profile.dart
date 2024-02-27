import 'dart:math';
import 'package:bill_split/src/utils/validators/validators.dart';
import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../ui/components/selectAvatar_dialog.dart';
import '../../../../common/form_fields/currency_form_field.dart';
import '../../../../common/form_fields/custom_form_field.dart';
import '../../../../common/form_fields/phone_number_field.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/blueButton.dart';
import '../../../../constants/storage_constants.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/utils.dart';
import '../../controllers/re_profile_controller.dart';
class ProfileRegPage extends StatelessWidget {
  const ProfileRegPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileRegPageController());
    final firstNameNode = FocusNode();
    final lastNameNode = FocusNode();
    final currencyNode = FocusNode();
    final phoneNumberNode = FocusNode();
      return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.072916667),

          child: ListView(
            children: [
              SizedBox(height: screenHeight * 0.0800),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Complete Your Profile",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: screenHeight * 0.042249047, //38
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.050814485),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).primaryColorDark.withOpacity(0.35),
                                offset: Offset(3.0, 3.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Feedback.forTap(context);
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => AvatarPicker(pictureUrlController: controller.photoUrlController),
                              );
                            },
                            child: CircleAvatar(
                              child: FadeInImage(
                                placeholder: AssetImage('assets/icons/misc/loader.png'),
                                image:FirebaseImageProvider(
                                    FirebaseUrl(controller.photoUrlController.text)
                                ),
                              ),
                              radius: screenHeight * 0.04, // 51
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.042249047), // 38
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          fieldController: controller.firstName,
                          hintText: 'First Name',
                          prefixImage: 'assets/icons/auth_icons/firstName.svg',
                          keyboardType: TextInputType.text,
                          validator: (value) => TcValidator.validateEmptyText('First Name', value!), currentNode: firstNameNode,
                        ),
                        SizedBox(height: screenHeight * 0.024459975), // 22
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          maxLines: 1,
                          fieldController: controller.lastName,
                          hintText: 'Last Name',
                          prefixImage: 'assets/icons/auth_icons/lastName.svg',
                          keyboardType: TextInputType.text,
                          validator: (value) => TcValidator.validateEmptyText('Last Name', value!), currentNode: lastNameNode,


                        ),
                        SizedBox(height: screenHeight * 0.024459975), // 22
                        CurrencyFormField(
                          defaultCurrencyCodeController: controller.currencyController,
                          enabled: true, currentNode: currencyNode,
                        ),
                        SizedBox(height: screenHeight * 0.024459975), // 22
                        PhoneNumberField(
                          textInputAction: TextInputAction.done,
                          phoneController: controller.phoneNumber,
                          hintText: 'Phone Number', initialPhone: '', focusNode: phoneNumberNode,
                        ),

                        SizedBox(height: screenHeight * 0.042249047),
                        BlueButton(
                            title: "Save and Continue",
                            onPressed: (){}//_onSaveButtonPressed,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
}


