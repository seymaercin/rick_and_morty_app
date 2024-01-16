import 'package:flutter/material.dart';

class Character with ChangeNotifier {
  int id;
  String name;
  String status;
  String gender;
  String image;

  Character(this.id, this.name, this.status, this.gender, this.image);

  Character.fromMap(Map<String, dynamic> map)
      : id = map["id"] ?? 0,
        name = map["name"] ?? "",
        gender = map["gender"] ?? "",
        status = map["status"] ?? "",
        image = map["image"] ?? "";

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "gender": gender,
      "status": status,
      "image": image,
    };
  }
}
