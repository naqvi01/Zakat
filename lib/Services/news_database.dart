// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:imagecompresser/models/news_model.dart';

// class Database {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   Stream<List<NewsModelList>> get news {
//     return _firebaseFirestore.collection('news').snapshots().map((QuerySnapshot querySnapshot) => querySnapshot.docs.map((e) => NewsModelList(Title: e.data["Title"], Description: e.data["Description"]));
//   }
// }
