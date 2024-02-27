import 'package:bill_split/src/utils/theme/custom_themes/appbar_theme.dart';
import 'package:bill_split/src/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:bill_split/src/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:bill_split/src/utils/theme/custom_themes/chip_theme.dart';
import 'package:bill_split/src/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:bill_split/src/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:bill_split/src/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'custom_themes/text_themes.dart';

class TcAppTheme {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TcTextTheme.lightTextTheme,
      chipTheme: TcChipTheme.lightChipTheme,
      appBarTheme: TcAppBarTheme.lightAppBarTheme,
      checkboxTheme: TcCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: TcBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: TcElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TcOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: TcTextFormFieldTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TcTextTheme.darkTextTheme,
      chipTheme: TcChipTheme.darkChipTheme,
      appBarTheme: TcAppBarTheme.darkAppBarTheme,
      checkboxTheme: TcCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: TcBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: TcElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TcOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TcTextFormFieldTheme.darkInputDecorationTheme
  );
}
