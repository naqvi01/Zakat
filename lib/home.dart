import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:imagecompresser/comptition.dart';
import 'package:imagecompresser/events.dart';
import 'package:imagecompresser/explore.dart';
import 'package:imagecompresser/news.dart';
import 'package:imagecompresser/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [
    "News",
    'Explore',
    "Competions",
    "Events",
  ];

  List screens = [NewsList(), ExploreList(), CompititionList(), EventsList()];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          TrendingSlider(),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          currentindex = index;
                        }),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.all(5),
                          width: 80,
                          height: 45,
                          decoration: BoxDecoration(
                              color: currentindex == index
                                  ? Colors.white
                                  : Color.fromARGB(255, 197, 197, 197),
                              borderRadius: currentindex == index
                                  ? BorderRadius.circular(50)
                                  : BorderRadius.circular(20),
                              border: currentindex == index
                                  ? Border.all(color: Colors.red, width: 2.5)
                                  : null),
                          child: Center(
                            child: Text(
                              items[index],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: currentindex == index,
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ))
                    ],
                  );
                }),
          ),
          Container(
              width: double.infinity,
              height: 340,
              decoration: BoxDecoration(color: Colors.transparent),
              child: screens[currentindex])
        ],
      )),
    );
  }
}
