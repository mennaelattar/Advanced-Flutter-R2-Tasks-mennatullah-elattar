import 'package:final_project/models/faviourate.dart';
import 'package:final_project/models/recipe.dart';
import 'package:flutter/material.dart';

class AppViewModel extends ChangeNotifier {
  List<Favourite> favourite_list = <Favourite>[];

  addToFaviourateList(Favourite new_fav) {
    favourite_list.add(new_fav);
    notifyListeners();
  }

  favouriteListCount() {
    return favourite_list.length;
  }
}