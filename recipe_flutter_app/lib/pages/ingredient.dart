import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_flutter_app/provider/ingredient.provider.dart';

class IngredientPage extends StatefulWidget {
  const IngredientPage({super.key});

  @override
  State<IngredientPage> createState() => _IngredientPageState();
}

class _IngredientPageState extends State<IngredientPage> {
  @override
  void initState() {
    Provider.of<IngredientsProvider>(context, listen: false).getIngredients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<IngredientsProvider>(
          builder: (context, ingredient_provider, child) =>
              ingredient_provider.ingredientList == null
                  ? CircularProgressIndicator()
                  : ingredient_provider.ingredientList?.isEmpty ?? false
                      ? Text("list is empty")
                      : ListView.builder(
                          itemCount: ingredient_provider.ingredientList!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: Checkbox(
                                  tristate: true,
                                  value: ingredient_provider
                                      .ingredientList![index].userIds
                                      ?.contains(1),
                                  onChanged: (value) {
                                    ingredient_provider.addIngredientsToUser(
                                        ingredient_provider
                                            .ingredientList![index].docId!,
                                        value ?? false);
                                  },
                                ),
                                title: Text(ingredient_provider
                                        .ingredientList![index].name ??
                                    'no name'));
                          })),
    );
  }
}
