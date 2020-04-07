import 'package:intl/intl.dart';

class FormatterDate {

  static DateTime strToDate(String str) {
    return new DateFormat("yyyy-MM-ddThh:mm:ss.000Z").parse(str);
  }

  static String dateToStr(DateTime date) {
    return DateFormat("dd-MM-yyyy hh:mm:ss").format(date);
  }

  static String apply(String str) {
    return dateToStr(strToDate(str));
  }
}