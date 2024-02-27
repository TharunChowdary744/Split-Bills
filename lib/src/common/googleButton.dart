
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../ui/constants.dart';
import '../utils/utils.dart';

class GoogleButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  GoogleButton({required this.title, required this.onPressed})
      : assert(onPressed != null),
        assert(title != null);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: kBorderRadius,
      color: Colors.transparent,
      elevation: 2.0,
      shadowColor: Colors.grey[400]!.withOpacity(0.2),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01500953), // 13.5
          primary: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius,
            side: BorderSide(
              width: 1.0,
              color: Colors.grey[500]!.withOpacity(0.5),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/auth_icons/google.svg',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              height: screenWidth * 0.068055556, // 28
              width: screenWidth * 0.068055556, // 28
            ),
            SizedBox(
              width: screenWidth * 0.051041667, // 21
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: screenHeight * 0.017789072, //16
              ),
            )
          ],
        ),
      ),
    );
  }
}
