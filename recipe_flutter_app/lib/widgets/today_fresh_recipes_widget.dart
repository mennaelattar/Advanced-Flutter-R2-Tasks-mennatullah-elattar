import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_flutter_app/models/recipie.model.dart';
import 'package:recipe_flutter_app/provider/today_fresh_recipes_provider.dart';

class TodayFreshRecipeWidget extends StatefulWidget {
  const TodayFreshRecipeWidget({super.key});

  @override
  State<TodayFreshRecipeWidget> createState() => _TodayFreshRecipeWidgetState();
}

class _TodayFreshRecipeWidgetState extends State<TodayFreshRecipeWidget> {
  List<QueryDocumentSnapshot> data_list = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await Provider.of<TodayFreshRecipeProvider>(context, listen: false)
        .getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodayFreshRecipeProvider>(
        builder: (context, today_recipe_prov, child) {
      return SizedBox(
          height: 380,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: today_recipe_prov.data_list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                color: Color.fromARGB(255, 233, 234, 240),
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Icon(Icons.heart_broken)),
                              ),
                              Expanded(
                                flex: 5,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Image.network(
                                    "${today_recipe_prov.data_list[index]['image']}",
                                    width: 180,
                                    height: 150,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "${today_recipe_prov.data_list[index]['category']}",
                              style: const TextStyle(
                                  color: Color(0xff1F95B3), fontSize: 13),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "${today_recipe_prov.data_list[index]['title']}",
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
//------- how to render widget in for loop
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
                              "${today_recipe_prov.data_list[index]['number_of_calories']} calories",
                              style: TextStyle(color: Color(0xffF55A00)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: RichText(
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
                                  flex: 5,
                                ),
                                Expanded(
                                  child: Text(""),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: RichText(
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
                                  flex: 5,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              );
            },
          ));
    });
  }
}
