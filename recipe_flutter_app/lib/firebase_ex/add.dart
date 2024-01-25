import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:recipe_flutter_app/models/faviourate.dart';
import 'package:recipe_flutter_app/viewModel/appViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipe_flutter_app/models/ad.model.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  List<Ad> adsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  CarouselController buttonCarouselController = CarouselController();
  int currentIndexPage = 0;
  bool pressFaviourateButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Icon(
              Icons.notification_add,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection('ads').add({
                    "title": "meal 5",
                    "image":
                        "https://cdn.loveandlemons.com/wp-content/uploads/2020/03/pantry-recipes-2-580x697.jpg"
                  });
                },
                child: Text('Add')),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('ads')
                      .get()
                      .then((QuerySnapshot query) => query.docs.forEach((doc) {
                            print(doc['title']);
                          }));
                },
                child: Text('Get Data')),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('ads')
                      .doc('5HfVmGFARl7sBrsmkJrN')
                      .get()
                      .then((DocumentSnapshot doc) {
                    if (doc.exists) {
                      return print("this doc exist");
                    } else {
                      return print("this doc not exist");
                    }
                  });
                },
                child: Text('Check Particular Record Exist')),
          ],
        ),
      )),
    );
  }
}
