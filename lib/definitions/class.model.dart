import 'dart:convert';

class Class {
  String id;
  String name;
  String courseId;
  List<String> atendeesIds;
  String date;
  String initHour;
  String endHour;


  Class({
    this.id,
    this.name,
    this.courseId,
    this.atendeesIds,
    this.date,
    this.initHour,
    this.endHour,
  });


  factory Class.fromJson(String str) => Class.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Class.fromMap(Map<String, dynamic> json) => Class(
    id: json["id"],
    name: json["name"],
    courseId: json["courseId"],
    atendeesIds: json["atendeesIds"],
    date: json["date"],
    initHour: json["initHour"],
    endHour: json["endHour"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "courseId": courseId,
    "atendeesIds": atendeesIds,
    "date": date,
    "initHour": initHour,
    "endHour": endHour
  };
}