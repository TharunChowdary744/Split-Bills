import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Initialize Utils
double screenHeight=0.0;
double screenWidth=0.0;
Brightness currentThemeBrightness=currentThemeBrightness;
// CountryDetails countryDetails=countryDetails;
void initializeUtils(BuildContext context) async {
  screenHeight = MediaQuery.of(context).size.height;
  screenWidth = MediaQuery.of(context).size.width;
  currentThemeBrightness = Theme.of(context).brightness;
  // countryDetails = CountryCodes.detailsForLocale();
}



// bool _isInternational() {
//   if (countryDetails.alpha2Code == 'IN' ||
//       DateTime.now().timeZoneOffset == Duration(hours: 5, minutes: 30)) {
//     return false;
//   } else {
//     return true;
//   }
// }
//
// bool get isInternational => _isInternational();
