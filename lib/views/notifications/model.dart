class NotificationModel {
  late final String image, title, body, time;
  late int id;

  NotificationModel({
    this.id=0,
   required this.image,
   required this.title,
   required this.body,
   required this.time,
  });
  NotificationModel.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    title = json["title"];
    body = json["body"];
    time = json["time"];
  }
}
