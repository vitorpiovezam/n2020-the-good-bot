import 'dart:convert';

class Course {
  String id;
  String name;
  String stundentsIds;

  Course({
    this.id,
    this.name,
    this.stundentsIds
  });

  factory Course.fromJson(String str) => Course.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Course.fromMap(Map<String, dynamic> json) => Course(
    id: json["id"],
    name: json["name"],
    stundentsIds: json["stundentsIds"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "stundentsIds": stundentsIds,
  };
}
