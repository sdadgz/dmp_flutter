import 'package:logger/logger.dart';

// 日志
class Log {
  static final Logger _logger = Logger(
    printer: PrefixPrinter(PrettyPrinter()),
  );
  
  static void verbose(dynamic message) {
    _logger.v(message);
  }

  static void debug(dynamic message) {
    _logger.d(message);
  }

  static void info(dynamic message) {
    _logger.i(message);
  }

  static void warn(dynamic message) {
    _logger.w(message);
  }

  static void error(dynamic message) {
    _logger.e(message);
  }

  static void wtf(dynamic message) {
    _logger.wtf(message);
  }
}