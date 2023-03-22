import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants.dart';
import 'package:flutter_application_1/view/pages/activity_page/model/activity_model.dart';

Widget ActivityItem(ActivityModel activityModel) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          Icon(
            activityModel.icon,
            size: 85,
          ),
          SizedBox(
            height: 80,
          ),
          Text(activityModel.timeonly)
        ]),
        Column(children: [
          Text(activityModel.name.toString()),
          Text(
            activityModel.subtitle.toString(),
            style: TextStyle(color: myGreen, fontSize: 18),
          ),
          Image.asset(
            activityModel.image!,
            width: 80,
            height: 80,
          ),
          Text(activityModel.dateonly.toString())
        ])
      ]),
    ),
  );
}
