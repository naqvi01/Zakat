import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatefulWidget {
  const TrendingSlider({super.key});

  @override
  State<TrendingSlider> createState() => _TrendingSliderState();
}

class _TrendingSliderState extends State<TrendingSlider> {
  List imageList = [
    {"id": 1, "image_path": 'images/DonationBanner.png'},
    {"id": 2, "image_path": 'images/DonationBanner1.png'},
    {"id": 3, "image_path": 'images/DonationBanner2.png'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: CarouselSlider(
              items: imageList
                  .map((item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ))
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: BouncingScrollPhysics(),
                autoPlay: true,
                reverse: false,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              print(entry);
              print(entry.key);
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? Colors.red
                          : Color.fromARGB(255, 255, 255, 255)),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
