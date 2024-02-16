// To parse this JSON data, do
//
//     final listViewBuilder = listViewBuilderFromJson(jsonString);


class Datum {
  String image;
  String title;
  String body;
  DateTime timestamp;

  Datum({
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    image: json["image"],
    title: json["title"],
    body: json["body"],
    timestamp: DateTime.parse(json["timestamp"]),
  );


}





