
class TaskModel {
  String title;
  String? subTitle;
  bool isDone;

  TaskModel({
    required this.title,
    this.subTitle,
    this.isDone = false,
  });
}
