import 'dart:convert';

class Case {
  String id;
  String country;
  String location;
  String infected;

  Case({
    this.id,
    this.country,
    this.location,
    this.infected,
  });

  factory Case.fromJson(String str) => Case.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Case.fromMap(Map<String, dynamic> json) => Case(
    id: json["id"],
    country: json["country"],
    location: json["location"],
    infected: json["infected"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "country": country,
    "location": location,
    "infected": infected,
  };
}
