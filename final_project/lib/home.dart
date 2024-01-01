import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:final_project/models/ad.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Ad> adsList = [];
  void getAds() async {
    var adsData = await rootBundle.loadString('assets/data/sample.json');
    var dataDecoded =
        List<Map<String, dynamic>>.from(jsonDecode(adsData)['ads']);
    adsList = dataDecoded.map((e) => Ad.fromJson(e)).toList();
    setState(() {});
  }

  @override
  void initState() {
    getAds();
    // TODO: implement initState
    super.initState();
  }

  CarouselController buttonCarouselController = CarouselController();
  int currentIndexPage = 0;
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
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                    color: Color.fromARGB(255, 238, 239, 243),
                    child: Icon(Icons.list),
                  ),
                )
              ]),
              SizedBox(
                height: 30,
              ),
              adsList.isEmpty
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Stack(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 200.0,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.4,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                viewportFraction: 0.7,
                                initialPage: 0,
                                onPageChanged: (index, reason) {
                                  currentIndexPage = index;
                                  setState(() {});
                                },
                              ),
                              carouselController: buttonCarouselController,
                              items: adsList.map((ad) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(ad.image!))),
                                  child: Text(
                                    ad.title.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      background: Paint()
                                        ..color = Color(0xffF55A00)
                                        ..strokeWidth = 20
                                        ..style = PaintingStyle.stroke,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 70),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffF55A00)),
                                        onPressed: () =>
                                            buttonCarouselController
                                                .previousPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.linear),
                                        child: Icon(Icons.arrow_back),
                                      ),
                                    ),
                                    Expanded(flex: 4, child: SizedBox()),
                                    Expanded(
                                      flex: 1,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffF55A00)),
                                        onPressed: () =>
                                            buttonCarouselController.nextPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.linear),
                                        child: Icon(Icons.arrow_forward),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        DotsIndicator(
                          dotsCount: adsList.length,
                          position: currentIndexPage,
                          onTap: (position) async {
                            await buttonCarouselController
                                .animateToPage(position);
                            setState(() {});
                          },
                          decorator: DotsDecorator(
                            size: const Size.square(9.0),
                            activeSize: const Size(18.0, 9.0),
                            activeColor: Color(0xffF55A00),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ],
                    ),
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
              SizedBox(
                  height: 380,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Card(
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
                                          child: Image.asset(
                                            "assets/dishes/Assests/460x533_ChickenThighs_2 copy.png",
                                            width: 180,
                                            height: 150,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "Breakfast",
                                      style: TextStyle(
                                          color: Color(0xff1F95B3),
                                          fontSize: 13),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "French Toast with Berries",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "120 calories",
                                      style:
                                          TextStyle(color: Color(0xffF55A00)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Card(
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
                                          child: Image.asset(
                                            "assets/dishes/Assests/460x533_ChickenThighs_2 copy.png",
                                            width: 180,
                                            height: 150,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "Breakfast",
                                      style: TextStyle(
                                          color: Color(0xff1F95B3),
                                          fontSize: 13),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "French Toast with Berries",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "120 calories",
                                      style:
                                          TextStyle(color: Color(0xffF55A00)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Card(
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
                                          child: Image.asset(
                                            "assets/dishes/Assests/460x533_ChickenThighs_2 copy.png",
                                            width: 180,
                                            height: 150,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "Breakfast",
                                      style: TextStyle(
                                          color: Color(0xff1F95B3),
                                          fontSize: 13),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "French Toast with Berries",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      "120 calories",
                                      style:
                                          TextStyle(color: Color(0xffF55A00)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                      ),
                    ],
                  )),
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
                                        color:
                                            Color.fromARGB(255, 162, 164, 175),
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
                                        color:
                                            Color.fromARGB(255, 162, 164, 175),
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
        )));
  }
}
