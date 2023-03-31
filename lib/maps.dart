import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
              child: Text(
            "Here Nearby slum areas or NGO's are shown on Maps which helps to easily donate to poor families near you . We didn't implement this because we didn't get Google Maps API but our idea is to impelement map which show nearby slum areas or NGO's for donation of anything to poor families. ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          )),
        ));
  }
}
