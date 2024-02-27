
class TcValidator {

  static String validateEmptyText(String fieldName, String value) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required.";
    }
    return '';
  }

  static String? validateEmail(String value) {
    if (value == null || value.isEmpty) return "Email is required";

    final String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return "Invalid Email address";
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value == null || value.isEmpty)
      return "Password is required";
    else if (value.length < 8)
      return "Password must be atleast 6 characters long.";
    else if (value.contains(" "))
      return "Password should not contain spaces";
    else
      return null;
  }

  static String? validateConfirmPassword(
      {required String? confirmPassword, required String? newPassword}) {
    final _normalValidation = validatePassword(confirmPassword!);

    if (_normalValidation != '') return _normalValidation;

    if (confirmPassword != newPassword)
      return "Passwords do not match";
    else
      return null;
  }

  static String? validatePhoneNumber(String? value) {
    final _phoneRegExp = RegExp(r'^\d{10}$');
    if (value == null || value.isEmpty) return "Phone number is required";

    if (!_phoneRegExp.hasMatch(value)) {
      return "Invalid phone number format (10 digits required)";
    }

    return null;
  }

  // Without country codes
  // String? validateShortPhoneNumber(String? number) {
  //   if (number == null || number.isEmpty)
  //     return "This field cannot be empty";
  //   else if (number.contains(RegExp(r'[A-Za-z]-+')))
  //     return "Enter a valid phonenumber";
  //   else if (number.length <= 10)
  //     return "Enter a valid phonenumber";
  //   else {
  //     if (isInternational)
  //       return null;
  //     else {
  //       final _numberRegex = RegExp(r'[0-9]');
  //       final _matches = _numberRegex.allMatches(number);
  //       if (_matches.length != 10)
  //         return "Please enter a valid phone number";
  //       else
  //         return null;
  //     }
  //   }
  // }

  String validateCost(String cost) {
    if (cost.isEmpty)
      return "This field cannot be empty";
    else if (cost.contains(",") ||
        cost.contains("-") ||
        cost.contains(" ") ||
        cost.contains("_"))
      return "Enter a valid amount";
    else if (cost.contains(RegExp(r'[A-Za-z]')))
      return "Enter a valid amount";
    else
      return '';
  }

  static String?  validateName(String? value, String? fieldName) {
    if (value == null || value.isEmpty)
      return "$fieldName is required.";
      // return "This field cannot be empty";
    else if (value.contains(RegExp(r'[0-9]')))
      return "Enter a valid name";
    else
      return null;
  }

  ///  To validate normal text which cannot be empty
  String validateNonEmptyText(String text) {
    if (text.isEmpty)
      return "This field cannot be empty";
    else
      return '';
  }

  ///  To validate normal text which can be empty
  String validateCanBeEmptyText(String text) {
    return '';
  }
}
