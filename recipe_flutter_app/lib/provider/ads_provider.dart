import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_flutter_app/models/ad.model.dart';

class AdsProvider extends ChangeNotifier {
  List<Ad>? _addList;
  List<Ad>? get addList => _addList;

  Future<void> getAds() async {
    try {
      var result = await FirebaseFirestore.instance.collection('ads').get();
      if (result.docs.isNotEmpty) {
        _addList = List<Ad>.from(result.docs
            .map((document) => Ad.fromJson(document.data(), document.id)));
      } else {
        _addList = [];
      }
      notifyListeners();
    } catch (e) {
      _addList = [];
      notifyListeners();
    }
  }
}
