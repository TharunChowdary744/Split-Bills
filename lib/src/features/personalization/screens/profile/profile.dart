import 'package:bill_split/src/common/widgets/appbar/appbar.dart';
import 'package:bill_split/src/features/personalization/controllers/user_controller.dart';
import 'package:bill_split/src/features/personalization/screens/profile/change_name.dart';
import 'package:bill_split/src/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:bill_split/src/section_heading.dart';
import 'package:bill_split/src/shimmer.dart';
import 'package:bill_split/src/tc_circular_image.dart';
import 'package:bill_split/src/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TcAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TcSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                    ()
                    {
                      final networkImage = controller.user.value.profilePicture;
                      final image=networkImage.isNotEmpty?networkImage:TcImages.user;
                         return controller.imageUploading.value?TcShimmerEffect(width: 80, height: 80,radius: 80,):TcCircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                           isNetworkImage: networkImage.isNotEmpty,
                          );
                        }),
                    TextButton(
                        onPressed: ()=>controller.uploadUserProfilePicture(),
                        child: Text('Change Profile Picture')),
                  ],
                ),
              ),
              SizedBox(
                height: TcSizes.spaceBtwItems / 2,
              ),
              Divider(),
              SizedBox(
                height: TcSizes.spaceBtwItems,
              ),
              TcSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              SizedBox(
                height: TcSizes.spaceBtwItems,
              ),
              TcProfileMenu(onPressed: ()=>Get.to(()=>ChangeName()), title: 'Name', value: controller.user.value.fullName,),
              // TcProfileMenu(onPressed: () {  }, title: 'Username', value: controller.user.value.username,),

              SizedBox(
                height: TcSizes.spaceBtwItems / 2,
              ),
              Divider(),
              SizedBox(
                height: TcSizes.spaceBtwItems,
              ),
              TcSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              SizedBox(
                height: TcSizes.spaceBtwItems,
              ),
              TcProfileMenu(onPressed: () {  }, title: 'User ID', value: controller.user.value.id,icon: Iconsax.copy_copy,),
              TcProfileMenu(onPressed: () {  }, title: 'E-mail', value: controller.user.value.email,),
              controller.user.value.phoneNumber!=''?TcProfileMenu(onPressed: () {  }, title: 'Phone Number', value: controller.user.value.phoneNumber,):SizedBox(),
              Divider(),
              SizedBox(height: TcSizes.spaceBtwItems,),
              Center(
                child: TextButton(
                  onPressed: ()=>controller.deleteAccountWarningPopup(),
                  child: Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

