import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:imagecompresser/account.dart';
import 'package:imagecompresser/home.dart';
import 'package:imagecompresser/maps.dart';
import 'package:imagecompresser/subscription.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  final Screens = [HomeScreen(), Subscription(), Maps(), Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GNav(
            onTabChange: (index) {
              setState(() {
                this.index = index;
              });
            },
            tabMargin: EdgeInsets.all(10),
            tabBackgroundColor: Colors.red,
            padding: EdgeInsets.all(10),
            gap: 8,
            backgroundColor: Colors.blue,
            color: Colors.white,
            activeColor: Colors.white,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.money_rounded,
                text: 'Donation',
              ),
              GButton(
                icon: Icons.directions,
                text: 'Find',
              ),
              GButton(
                icon: Icons.person,
                text: 'account',
              ),
            ]),
        body: Screens[index]);
  }
}
