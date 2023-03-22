import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityModel {
  String? name;
  String? subtitle;
  IconData icon;
  String? image;
  DateTime dateTime;
  String get dateonly {
    String formattedDate = DateFormat("yyyy/MM/dd").format(dateTime);
    return formattedDate;
  }

  String get timeonly {
    bool time = DateFormat("a").format(dateTime) == "PM";

    String day = "";
    switch (dateTime.weekday) {
      case DateTime.friday:
        {
          day = "الجمعة";
        }
        break;
      case DateTime.saturday:
        {
          day = "السبت";
        }
        break;
      case DateTime.sunday:
        {
          day = "الأحد";
        }
        break;
      case DateTime.monday:
        {
          day = "الإثنين";
        }
        break;
      case DateTime.tuesday:
        {
          day = "الثلاثاء";
        }
        break;
      case DateTime.wednesday:
        {
          day = "الإربعاء";
        }
        break;
      case DateTime.thursday:
        {
          day = "الخميس";
        }
        break;
    }

    String daynight = time ? "مساءا" : "صباحا";

    String formattedTime = DateFormat("hh:mm").format(dateTime);

    return "$day $formattedTime  $daynight";
  }

  ActivityModel(
      {required this.name,
      required this.subtitle,
      this.icon = Icons.person_2,
      required this.dateTime,
      this.image});
}
