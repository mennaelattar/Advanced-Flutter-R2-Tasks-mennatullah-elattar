import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:recipe_flutter_app/pages/ingredient.dart';
import 'package:recipe_flutter_app/viewModel/appViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_flutter_app/models/ad.model.dart';
import 'package:recipe_flutter_app/widgets/ads_widget.dart';
import 'package:recipe_flutter_app/widgets/today_fresh_recipes_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Ad> adsList = [];
  CarouselController buttonCarouselController = CarouselController();
  int currentIndexPage = 0;
  bool pressFaviourateButton = false;

  late ZoomDrawerController controller;

  @override
  void initState() {
    controller = ZoomDrawerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
      mainScreenTapClose: true,
      controller: controller,
      drawerShadowsBackgroundColor: Colors.grey.shade300,
      menuScreen: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                onTap: () {
                  controller.close?.call();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (__) => IngredientPage()));
                },
                leading: Icon(Icons.food_bank),
                title: Text('Ingredents'),
              )
            ],
          ),
        ),
      ),
      mainScreen: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: InkWell(
              onTap: () {
                controller.toggle!();
              },
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
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
        body: ChangeNotifierProvider(
          create: (context) => AppViewModel(),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20),
              children: [
                Text(
                  "Bonjour,Emma",
                  style: TextStyle(color: Color(0xffBEC3CF), fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "What would you like to cook today ? ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xffBEC3CF),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Search for recieps',
                          hintStyle: TextStyle(color: Color(0xffBEC3CF)),
                          filled: true,
                          fillColor: Color.fromARGB(255, 238, 239, 243)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                      color: Color.fromARGB(255, 238, 239, 243),
                      child: Icon(Icons.list),
                    ),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                AdsWidget(),
                SizedBox(
                  height: 30,
                ),
                Row(children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Today's Fresh Recipes",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Text(
                          'See All',
                          style: TextStyle(
                              color: Color(0xffF55A00),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ))
                ]),
                SizedBox(
                  height: 30,
                ),
                TodayFreshRecipeWidget(),
                SizedBox(
                  height: 30,
                ),
                Row(children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Recommended",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Text(
                          'See All',
                          style: TextStyle(
                              color: Color(0xffF55A00),
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ))
                ]),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  color: Color.fromARGB(255, 233, 234, 240),
                  child: SizedBox(
                    width: 300,
                    height: 150,
                    child: Row(children: [
                      Image.asset(
                        "assets/dishes/Assests/460x533_ChickenThighs_2 copy.png",
                        width: 100,
                        height: 150,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "Breakfast",
                              style: TextStyle(
                                  color: Color(0xff1F95B3), fontSize: 13),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "French Toast with Berries",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffF55A00),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffF55A00),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffF55A00),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffF55A00),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffF55A00),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "120 calories",
                              style: TextStyle(color: Color(0xffF55A00)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.alarm,
                                          size: 14,
                                          color: Color.fromARGB(
                                              255, 162, 164, 175),
                                        ),
                                      ),
                                      TextSpan(
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 162, 164, 175)),
                                        text: "10 mins",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.alarm,
                                          size: 14,
                                          color: Color.fromARGB(
                                              255, 162, 164, 175),
                                        ),
                                      ),
                                      TextSpan(
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 162, 164, 175)),
                                        text: "1 Serving",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
