import 'dart:convert';

class User {
  String id;
  String name;
  String type;
  String coursesIds;

  User({
    this.id,
    this.name,
    this.type,
    this.coursesIds,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    coursesIds: json["coursesIds"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "type": type,
    "coursesIds": coursesIds,
  };
}
