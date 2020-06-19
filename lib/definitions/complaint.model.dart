import 'dart:convert';

class Complaint {
  String id;
  String type;
  String description;
  String address;

  Complaint({
    this.id,
    this.type,
    this.description,
    this.address,
  });

  factory Complaint.fromJson(String str) => Complaint.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Complaint.fromMap(Map<String, dynamic> json) => Complaint(
    id: json["id"],
    type: json["type"],
    description: json["description"],
    address: json["address"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "type": type,
    "description": description,
    "address": address,
  };
}
