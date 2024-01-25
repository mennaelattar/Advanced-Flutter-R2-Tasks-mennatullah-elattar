class Recipe {
  String? docId;
  String? title;
  String? image;
  String? category;
  int? number_of_calories;
  int? rating;
  List<String>? userIds;

  Recipe();
  Recipe.fromJson(Map<String, dynamic> data, String id) {
    docId = id;
    title = data['title'];
    image = data['image'];
    category = data['category'];
    number_of_calories = data['number_of_calories'];
    rating = data['rating'];
    userIds = data['favourite_user_ids'] != null
        ? List<String>.from(data['favourite_user_ids']
            .map((e) => e.toString())) //to make sure the return value is string
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "image": image,
      "category": category,
      "number_of_calories": number_of_calories,
      "rating": rating,
      "userIds": userIds
    };
  }
}
