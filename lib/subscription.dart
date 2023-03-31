import 'package:flutter/material.dart';
import 'package:imagecompresser/donatecards.dart';

class Subscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Total Donation',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '\$10000.00',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 21, 21),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/5screen'),
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 33, 248, 165),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Text(
                  'Track Subscription',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/3screen');
                  },
                  child: Cards(
                    image: AssetImage('images/donateclothesicon.png'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/4screen');
                  },
                  child: Cards(
                    image: AssetImage('images/foodhandicon.png'),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
