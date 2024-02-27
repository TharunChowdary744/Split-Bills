import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/utils.dart';

class DrawerTile extends StatelessWidget {
  final Function onTap;
  final String title;
  final String icon;
  const DrawerTile(
      {required this.title, required this.icon, required this.onTap})
      : assert(icon != null),
        assert(title != null),
        assert(onTap != null);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0.0),
        splashFactory: InkRipple.splashFactory,
        backgroundColor: Theme.of(context).splashColor,
        textStyle: TextStyle(color: Theme.of(context).highlightColor),
        // splashColor: Theme.of(context).splashColor,
        // highlightColor: Theme.of(context).highlightColor,
      ),
      onPressed: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(
              icon,
              color: Theme.of(context).iconTheme.color,
              fit: BoxFit.contain,
              height: screenHeight * 0.030795426,
              width: screenHeight * 0.030795426,
            ),
            SizedBox(width: screenWidth * 0.0486618),
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: screenHeight * 0.015341804,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
