import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants.dart';
import 'package:flutter_application_1/view/pages/activity_page/activity_item.dart';
import 'package:flutter_application_1/view/pages/activity_page/model/activity_model.dart';

class ActivityPage extends StatelessWidget {
  ActivityPage({super.key});
  List<ActivityModel> activityList = [
    ActivityModel(
        name: "محمد الاحول",
        subtitle: "طلب المزيد من المواد",
        image: "assets/m.png",
        dateTime: DateTime.now()),
    ActivityModel(
        name: "محمد الاحول",
        subtitle: "طلب المزيد من المواد",
        image: "assets/m2.png",
        dateTime: DateTime.now()),
    ActivityModel(
        name: "محمد الاحول",
        subtitle: "طلب المزيد من المواد",
        image: "assets/e.png",
        dateTime: DateTime.now()),
    ActivityModel(
        name: "محمد الاحول",
        subtitle: "طلب المزيد من المواد",
        image: "assets/m.png",
        dateTime: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myGreen,
        title: Center(child: Text("النشاطات")),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: activityList.length,
              itemBuilder: (context, index) {
                return ActivityItem(activityList[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
