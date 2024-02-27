import 'package:bill_split/src/bindings/general_bindings.dart';
import 'package:bill_split/src/features/authentication/screens/login/login_page.dart';
import 'package:bill_split/src/features/authentication/screens/signup/signup.dart';
import 'package:bill_split/src/utils/constants/colors.dart';
import 'package:bill_split/src/utils/theme/theme.dart';
import 'package:bill_split/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeUtils(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TcAppTheme.lightTheme,
      darkTheme: TcAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialBinding: GeneralBindings(),
      home: Scaffold(
        backgroundColor: TcColors.white,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/registration', page: () => SignUpPage()),
      ],
    );
  }
}
