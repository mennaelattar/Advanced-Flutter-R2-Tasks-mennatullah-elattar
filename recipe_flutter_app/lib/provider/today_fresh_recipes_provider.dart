import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_flutter_app/models/recipie.model.dart';

class TodayFreshRecipeProvider extends ChangeNotifier {
  // // List<Ad>? _addList;
  // // List<Ad>? get addList => _addList;

  // // Future<void> getAds() async {
  // //   try {
  // //     var result = await FirebaseFirestore.instance.collection('ads').get();
  // //     if (result.docs.isNotEmpty) {
  // //       _addList = List<Ad>.from(result.docs
  // //           .map((document) => Ad.fromJson(document.data(), document.id)));
  // //     } else {
  // //       _addList = [];
  // //     }
  // //     notifyListeners();
  // //   } catch (e) {
  // //     _addList = [];
  // //     notifyListeners();
  // //   }
  // // }

  // List<QueryDocumentSnapshot> data_list = [];

  // getRecipes() async {
  //   var results = await FirebaseFirestore.instance
  //       .collection('today_fresh_recipes')
  //       .get();
  //   data_list.addAll(results.docs);
  //   notifyListeners();
  // }

  // // getRecipeListLength() {
  // //   return data_list.length;
  // // }

  // Future<int> getRecipeListLength() async {
  //   return await data_list.length;
  // }
  List<Recipe>? _recipeList;
  List<Recipe>? get recipeList => _recipeList;

  Future<void> getRecipes() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('today_fresh_recipes')
          .get();

      if (result.docs.isNotEmpty) {
        _recipeList = List<Recipe>.from(result.docs
            .map((document) => Recipe.fromJson(document.data(), document.id)));
      } else {
        _recipeList = [];
      }
      notifyListeners();
    } catch (e) {
      _recipeList = [];
      notifyListeners();
    }
  }

  Future<void> addFavouriteRecipesToUser(String recipeId, bool isAdd) async {
    try {
      if (isAdd) {
        var result = await FirebaseFirestore.instance
            .collection('today_fresh_recipes')
            .doc(recipeId)
            .update({
          "user_ids": FieldValue.arrayUnion(['3'])
        });
      } else {
        var result = await FirebaseFirestore.instance
            .collection('today_fresh_recipes')
            .doc(recipeId)
            .update({
          "user_ids": FieldValue.arrayUnion(['3'])
        });
      }
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
