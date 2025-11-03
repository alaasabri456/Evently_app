import 'package:intl/intl.dart';

extension DateExtension on DateTime{
  String get viewMonthName{
    DateFormat formatter=DateFormat("MMM");
    return formatter.format(this);
  }

  String get viewDayNumber{

    return day.toString();
  }
}