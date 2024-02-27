import 'package:bill_split/src/common/form_fields/custom_form_field.dart';
import 'package:bill_split/src/common/widgets/appbar/appbar.dart';
import 'package:bill_split/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validators.dart';
import '../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final _firstNameNode = FocusNode();
    final _lastNameNode = FocusNode();
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TcAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
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
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                        fieldController: controller.firstName,
                        hintText: TcTexts.firstName,
                        prefixImage: TcImages.textFieldName,
                        keyboardType: TextInputType.text,
                        currentNode: _firstNameNode,
                        textInputAction: TextInputAction.next,
                        validator: (value) =>
                            TcValidator.validateName(value!, 'First Name'),
                        maxLines: 1),
                    SizedBox(
                      height: TcSizes.spaceBtwInputFields,
                    ),
                    CustomTextFormField(
                        fieldController: controller.lastName,
                        hintText: TcTexts.lastName,
                        prefixImage: TcImages.textFieldName,
                        keyboardType: TextInputType.text,
                        currentNode: _lastNameNode,
                        textInputAction: TextInputAction.next,
                        validator: (value) =>
                            TcValidator.validateName(value!, 'Last Name'),
                        maxLines: 1),
                  ],
                )),
            SizedBox(
              height: TcSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
