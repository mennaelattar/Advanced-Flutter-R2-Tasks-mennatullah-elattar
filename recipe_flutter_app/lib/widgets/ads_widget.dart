import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:recipe_flutter_app/models/ad.model.dart';
import 'package:recipe_flutter_app/provider/ads_provider.dart';

class AdsWidget extends StatefulWidget {
  const AdsWidget({super.key});

  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  List<Ad> adsList = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await Provider.of<AdsProvider>(context, listen: false).getAds();
  }

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    int currentIndexPage = 0;
    bool pressFaviourateButton = false;
    return Consumer<AdsProvider>(
        builder: (context, adProvider, __) => adProvider.addList == null
            ? CircularProgressIndicator()
            : adProvider.addList?.isEmpty ?? false
                ? Text("list is empty")
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
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              viewportFraction: 0.7,
                              initialPage: 0,
                              onPageChanged: (index, reason) {
                                currentIndexPage = index;
                                setState(() {});
                              },
                            ),
                            carouselController: buttonCarouselController,
                            items: adsList!.map((ad) {
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
                                          buttonCarouselController.previousPage(
                                              duration:
                                                  Duration(milliseconds: 300),
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
                    ],
                  ));
  }
}
