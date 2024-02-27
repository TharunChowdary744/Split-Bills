import 'package:logger/logger.dart';

class TcLoggerHelper {
  static final _logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      errorMethodCount: 3,
      lineLength: 50,
      methodCount: 0,
      printEmojis: true,
      printTime: false,
    ),
    level: Level.debug,
  );

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [dynamic error]) {
    _logger.w(message, error: error, stackTrace: StackTrace.current);
  }
}
