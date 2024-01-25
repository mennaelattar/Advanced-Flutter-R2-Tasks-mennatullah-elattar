import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_flutter_app/models/ingredient.model.dart';

class IngredientsProvider extends ChangeNotifier {
  List<Ingredient>? _ingredientList;
  List<Ingredient>? get ingredientList => _ingredientList;

  Future<void> getIngredients() async {
    try {
      var result =
          await FirebaseFirestore.instance.collection('ingredients').get();

      if (result.docs.isNotEmpty) {
        _ingredientList = List<Ingredient>.from(result.docs.map(
            (document) => Ingredient.fromJson(document.data(), document.id)));
      } else {
        _ingredientList = [];
      }
      notifyListeners();
    } catch (e) {
      _ingredientList = [];
      notifyListeners();
    }
  }

  Future<void> addIngredientsToUser(String ingredientId, bool isAdd) async {
    try {
      if (isAdd) {
        var result = await FirebaseFirestore.instance
            .collection('ingredients')
            .doc(ingredientId)
            .update({
          "user_ids": FieldValue.arrayUnion(['3'])
        });
      } else {
        var result = await FirebaseFirestore.instance
            .collection('ingredients')
            .doc(ingredientId)
            .update({
          "user_ids": FieldValue.arrayUnion(['3'])
        });
      }
      notifyListeners();
    } catch (e) {
      _ingredientList = [];
      notifyListeners();
    }
  }
}
