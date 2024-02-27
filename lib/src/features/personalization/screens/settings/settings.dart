import 'package:bill_split/src/common/list_tiles/settings_menu_tile.dart';
import 'package:bill_split/src/common/widgets/appbar/appbar.dart';
import 'package:bill_split/src/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:bill_split/src/data/authentication/authentication_repository.dart';
import 'package:bill_split/src/section_heading.dart';
import 'package:bill_split/src/tc_circular_image.dart';
import 'package:bill_split/src/utils/constants/colors.dart';
import 'package:bill_split/src/utils/constants/image_strings.dart';
import 'package:bill_split/src/utils/constants/sizes.dart';
import 'package:bill_split/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../common/list_tiles/user_profile_tile.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthenticationRepository.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TcPrimaryHeaderContainer(
                child: Column(
              children: [
                TcAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TcColors.white),
                  ),
                ),
                TcUserProfileTile(onPressed:()=>Get.to(()=>ProfileScreen())),
                SizedBox(
                  height: TcSizes.spaceBtwSections,
                ),
              ],
            )),
            Padding(
              padding: EdgeInsets.all(TcSizes.defaultSpace),
              child: Column(
                children: [
                  TcSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: TcSizes.spaceBtwItems,
                  ),
                  TcSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',

                  ),
                  TcSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                  ),
                  SizedBox(height: TcSizes.spaceBtwSections,),
                  TcSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  TcSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                  ),
                  SizedBox(height: TcSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(child: Text('Logout'),onPressed: ()=>controller.logout(),),
                  ),
                  SizedBox(height: TcSizes.spaceBtwSections*2.5,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
