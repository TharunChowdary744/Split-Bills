import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_review/in_app_review.dart';
import '../../../../../ui/constants.dart';
import '../../../../data/authentication/authentication_repository.dart';
import '../../../../utils/utils.dart';
import '../../../../common/drawer_tile.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({required this.animationController}) : assert(animationController != null);

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final _gradientColorList = Theme.of(context).brightness == Brightness.dark
        ? [
      Theme.of(context).primaryColor.withAlpha(100),
      Theme.of(context).cardColor,
    ]
        : [
      Theme.of(context).primaryColor.withAlpha(220),
      Theme.of(context).primaryColorLight.withAlpha(190)
    ];

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _gradientColorList),
      ),
      child: Container(
        margin: EdgeInsets.only(left: screenWidth * 0.06, right: screenWidth * 0.425),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopDrawer(drawerAnimationController: animationController),
            BottomDrawer(),
          ],
        ),
      ),
    );
  }
}

class TopDrawer extends StatelessWidget {
  final AnimationController drawerAnimationController;
  TopDrawer({required this.drawerAnimationController}) : assert(drawerAnimationController != null);

  final _analytics = FirebaseAnalytics.instance;
  final _verticalGap = 0.00501817 * screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: screenHeight * 0.085018043),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              "assets/icons/misc/JustSplit_logo_v3-08.svg",
              width: 0.083426029 * screenHeight,
              height: 0.083426029 * screenHeight,
            ),
            const SizedBox(height: 10.0),
            Text(
              " JustSplit.",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: screenHeight * 0.040801779,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.070491741),
        DrawerTile(
          title: "Home",
          icon: "assets/icons/drawer_menu/home.svg",
          onTap: () async {
            drawerAnimationController.reverse();
            Navigator.of(context).pushReplacementNamed('/home');
          },
        ),
        SizedBox(height: _verticalGap),
        DrawerTile(
          title: "Settings",
          icon: "assets/icons/drawer_menu/settings.svg",
          onTap: () {
            // Navigator.of(context).pushNamed(SettingsPage.id);
          },
        ),
        SizedBox(height: _verticalGap),
        DrawerTile(
          title: "Rate Us",
          icon: "assets/icons/drawer_menu/ratings.svg",
          onTap: () async {
            final InAppReview inAppReview = InAppReview.instance;
            inAppReview.openStoreListing(); // TODO Add appstore id when available

            await _analytics.logEvent(name: "rate_app");
          },
        ),
        SizedBox(height: _verticalGap),
        DrawerTile(
          title: "Share App",
          icon: "assets/icons/drawer_menu/share.svg",
          onTap: () async {
            await _analytics.logEvent(name: "share_app");
            await FlutterShare.share(
                title: "JustSplit",
                linkUrl: "https://play.google.com/store/apps/details?id=dot.studios.contri_app",
                text: 'Manage your expenses hassle free. Download JustSplit now.'
            );
          },
        ),
        SizedBox(height: _verticalGap),
        DrawerTile(
          title: "Support Developers",
          icon: "assets/icons/drawer_menu/support.svg",
          onTap: () async {
            await _analytics.logEvent(name: "support_dev");
            // Navigator.of(context).pushNamed(DonationPage.id);
          },
        ),
        SizedBox(height: _verticalGap),
        DrawerTile(
          title: "Contact Us",
          icon: "assets/icons/drawer_menu/contact-us.svg",
          onTap: () async {
            // await CustomerSupport.mailToSupport(subject: "Customer%20Care");
            await _analytics.logEvent(name: "mailto_support");
          },
        ),
        SizedBox(height: _verticalGap),
        DrawerTile(
          title: "Logout",
          icon: "assets/icons/drawer_menu/logout.svg",
          onTap: () async {
            AuthenticationRepository.instance.logout();
            // BlocProvider.of<AuthBloc>(context).add(JustLoggedOut());
            // await _analytics.logEvent(name: "logout");
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
      ],
    );
  }
}

class BottomDrawer extends StatelessWidget {
  const BottomDrawer();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Made with ♥ in India",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: screenHeight * 0.013341804,
          ),
        ),
        Text(
          "Copyright \u00A9 2021 Dot.Studios LLC",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: screenHeight * 0.013341804,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          tcAppVersion,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: screenHeight * 0.013341804,
          ),
        ),
        SizedBox(height: screenHeight * 0.038913596),
      ],
    );
  }
}
