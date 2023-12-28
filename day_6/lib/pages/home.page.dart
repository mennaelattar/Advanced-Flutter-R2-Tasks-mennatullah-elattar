import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List carouselList = [
    'assets/images/download_1.jpeg',
    'assets/images/download_2.jpeg',
    'assets/images/download_3.jpeg',
    'assets/images/download_4.jpeg',
    'assets/images/download_5.jpeg'
  ];
  CarouselController buttonCarouselController = CarouselController();
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.4,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  viewportFraction: 0.7,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    currentIndexPage = index;
                    setState(() {});
                  },
                ),
                carouselController: buttonCarouselController,
                items: carouselList.map((i) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image(image: AssetImage('${i}')),
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
                              backgroundColor: Colors.amber),
                          onPressed: () =>
                              buttonCarouselController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Expanded(flex: 4, child: SizedBox()),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber),
                          onPressed: () => buttonCarouselController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear),
                          child: Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          DotsIndicator(
            dotsCount: carouselList.length,
            position: currentIndexPage,
            onTap: (position) async {
              await buttonCarouselController.animateToPage(position);
              setState(() {});
            },
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeColor: Colors.amber,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ],
      ),
    );
  }
}
