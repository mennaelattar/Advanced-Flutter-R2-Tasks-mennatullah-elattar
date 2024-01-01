import 'dart:convert';

import 'package:flutter/material.dart';

void main(List<String> arguments) {
  var data = {"name": "menna", 'age': 33};
  print(data);
  print(data.runtimeType);
  print("========================");
  var encodedData = jsonEncode(data);
  print(encodedData);
  print(encodedData.runtimeType);
}

class User {
  String? name;
  int? age;
  bool? isAccepted;
  User();
  User.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    age = data['age'];
    isAccepted = data['isAccepted'];
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "age": age, "isAccepted": isAccepted};
  }
}
