import 'dart:convert';

List<Employees> employeesFromJson(String str) =>
    List<Employees>.from(json.decode(str).map((x) => Employees.fromJson(x)));

String employeesToJson(List<Employees> data) =>
     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employees {
  Employees({
    required this.id,
    required this.userId,
    required this.title,
  });

  int id;
  String userId;
  String title;

  factory Employees.fromJson(Map<String, dynamic> json){
    return Employees(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "title": title,
  };
}