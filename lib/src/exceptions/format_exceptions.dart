class TcFormatException implements Exception {
  final String message;

  TcFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  factory TcFormatException.fromMessage(String message) {
    return TcFormatException(message);
  }

  String get formattedMessage => message;

  factory TcFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return TcFormatException(
            'The email address format is invalid. Please enter a valid email');
      case 'invalid-phone-number-format':
        return TcFormatException(
            'The provided phone number format is invalid. Please enter a valid number');
      default:
        return TcFormatException(
            'An unexpected Firebase error occurred. Please try again');
    }
  }
}
