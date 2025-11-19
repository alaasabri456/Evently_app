import 'package:intl/intl.dart';

extension DateExtension on DateTime{
  String get viewMonthName{
    DateFormat formatter=DateFormat("MMM");
    return formatter.format(this);
  }

  String get viewDayNumber{

    return day.toString();
  }

  String get toFormattedDate{

    return DateFormat("dd-MM-yyyy").format(this);
  }


  String get toFormattedTime{
    return DateFormat("hh:mm").format(this);
  }

}