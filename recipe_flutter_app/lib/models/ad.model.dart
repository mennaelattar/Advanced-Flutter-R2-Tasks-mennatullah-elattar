class Ad {
  String? title;
  String? image;

  Ad();
  Ad.fromJson(Map<String, dynamic> data, String id) {
    title = data['title'];
    image = data['image'];
  }

  Map<String, dynamic> toJson() {
    return {"title": title, "image": image};
  }
}
