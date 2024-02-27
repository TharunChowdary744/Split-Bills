import 'package:bill_split/src/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../shimmer.dart';
import '../../tc_circular_image.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class TcUserProfileTile extends StatelessWidget {
  const TcUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
      leading:Obx(
              ()
          {
            final networkImage = controller.user.value.profilePicture;
            final image=networkImage.isNotEmpty?networkImage:TcImages.user;
            return controller.imageUploading.value?TcShimmerEffect(width: 50, height: 50,radius: 50,):TcCircularImage(
              image: image,
              width: 50,
              height: 50,
              isNetworkImage: networkImage.isNotEmpty,
            );
          }),
      title: Obx(
        ()=> Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TcColors.white),
        ),
      ),
      subtitle: Obx(
        ()=> Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TcColors.white),
        ),
      ),
      trailing: IconButton(
          onPressed:onPressed,
          icon: Icon(
            Iconsax.edit,
            color: TcColors.white,
          )),
    );
  }
}
