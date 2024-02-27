import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/utils.dart';

class TcAnimationLoaderWidget extends StatelessWidget {
  const TcAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: screenWidth * 0.8),
          SizedBox(
            height: TcSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: TcSizes.defaultSpace,),
          showAction?SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: TcColors.dark),
              child: Text(actionText!,style: Theme.of(context).textTheme.labelMedium),
            ),
          ):const SizedBox(),
        ],
      ),
    );
  }
}
