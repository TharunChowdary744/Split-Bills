import 'package:intl/intl.dart';

class TcFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_Us', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return "(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}";
    } else if (phoneNumber.length == 11) {
      return "(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}";
    }
    return phoneNumber;
  }

  /// need to test and complete the code first
  // static String internationalformatPhoneNumber(String phoneNumber) {
  //   var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
  //
  //   String countryCode = '+${digitsOnly.substring(0, 2)}';
  //   digitsOnly = digitsOnly.substring(2);
  //
  //   final formattedNumber = StringBuffer();
  //   formattedNumber.write('($countryCode)');
  //
  //   int i = 0;
  //   while (i < digitsOnly.length) {
  //     int groupLength = 2;
  //     if (i == 0 && countryCode == '+1') {
  //       groupLength = 3;
  //     }
  //
  //     int end = i + groupLength;
  //     formattedNumber.write(digitsOnly.substring(i, end));
  //
  //     if (end < digitsOnly.length) {
  //       formattedNumber.write(' ');
  //     }
  //     i = end;
  //   }
  // }
}
