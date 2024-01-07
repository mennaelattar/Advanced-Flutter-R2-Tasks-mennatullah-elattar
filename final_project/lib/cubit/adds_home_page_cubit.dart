import 'package:bloc/bloc.dart';
import 'package:final_project/models/ad.model.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

part 'adds_home_page_state.dart';

class AddsHomePageCubit extends Cubit<List<Ad>> {
  AddsHomePageCubit() : super([]);
  getAds() async {
    List<Ad> adsList = [];
    print("start get Ads function");
    var adsData = await rootBundle.loadString('assets/data/sample.json');
    var dataDecoded =
        List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);
    adsList = dataDecoded.map((e) => Ad.fromJson(e)).toList();
    // setState(() {});
    print("states will be emitted");
    emit(adsList);
  }
}
