import 'package:bill_split/src/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/blueButton.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TcSpacingStyles.paddingWithAppbarHeight * 2,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(image),
                width: TcHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TcSizes.spaceBtwSections), // 40

              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TcSizes.spaceBtwItems),
              Text(subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TcSizes.spaceBtwSections),
              BlueButton(
                title: TcTexts.tcContinue,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
