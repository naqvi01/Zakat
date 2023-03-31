import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:imagecompresser/Services/news_database.dart';
import 'package:imagecompresser/home.dart';
import 'package:imagecompresser/models/news_model.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<String> titlenews = [
    "Making this App for UN Solutions by GDSC 1",
    "Making this App for UN Solutions by GDSC 2",
    "Making this App for UN Solutions by GDSC 3",
    "Making this App for UN Solutions by GDSC 4",
    "Making this App for UN Solutions by GDSC 5",
    "Making this App for UN Solutions by GDSC 6",
  ];

  CollectionReference newsref =
      FirebaseFirestore.instance.collection('explore');

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(
    //     stream: newsref.snapshots(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const CircularProgressIndicator();
    //       }

    //       if (snapshot.hasData) {
    //         return ListView.builder(
    //           physics: BouncingScrollPhysics(),
    //           itemBuilder: (context, index) {
    //             return Text(
    //               "",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 50,
    //                   fontWeight: FontWeight.bold),
    //             );
    //           },
    //           itemCount: snapshot.data!.docs.length,
    //         );
    //       }
    //       // ${snapshot.data!.docs[index].data()['Title']}
    //       return Text(
    //         'There is no data',
    //         style: TextStyle(
    //             color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
    //       );
    //     });
    return ListView.builder(
        itemCount: titlenews.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, ind) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  titlenews[ind],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              )
            ],
          );
        });
  }
}
