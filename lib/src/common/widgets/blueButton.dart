import 'package:flutter/material.dart';

import '../../../ui/constants.dart';
import '../../utils/utils.dart';

class BlueButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  BlueButton({super.key, required this.title, required this.onPressed})
      : assert(onPressed != null),
        assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: kBorderRadius,
      color: Colors.transparent,
      elevation: 5.0,
      shadowColor: Theme.of(context).primaryColor.withOpacity(0.5),
      child: ElevatedButton(
        onPressed: onPressed ,
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius,
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.018900889, // 17
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: screenHeight * 0.017789072, // 16
            ),
          ),
        ),
      ),
    );
  }
}
