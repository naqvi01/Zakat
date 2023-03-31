import 'package:flutter/material.dart';

class TrackSubscription extends StatelessWidget {
  List<String> History = [
    "\$10000",
    "\$2000",
    "\$300",
    "\$40",
    "\$500",
    "\$5500",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Track'),
        actions: [Icon(Icons.notifications)],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              '\$18340',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Text(
              'Transaction History',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: History.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, ind) {
                    return Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            History[ind],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        )
                      ],
                    );
                  }),
            ),
          )
        ],
      )),
    );
  }
}
