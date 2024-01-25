class Ingredient {
  String? docId;
  String? name;
  String? image;
  List<String>? userIds;

  Ingredient();
  Ingredient.fromJson(Map<String, dynamic> data, String id) {
    docId = id;
    name = data['name'];
    image = data['image'];
    userIds = data['user_ids'] != null
        ? List<String>.from(data['user_ids']
            .map((e) => e.toString())) //to make sure the return value is string
        : null;
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "image": image, "userIds": userIds};
  }
}
