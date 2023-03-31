import 'package:flutter/material.dart';
import 'package:imagecompresser/form.dart';

class FoodDonationForm extends StatefulWidget {
  @override
  State<FoodDonationForm> createState() => _FoodDonationFormState();
}

class _FoodDonationFormState extends State<FoodDonationForm> {
  int person = 1;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Donate Food Details',
          style: TextStyle(
              fontFamily: 'PatrickHand', color: Colors.white, fontSize: 30),
        ),
      ),
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Forms(
                label: Text('Name'),
              ),
              Forms(
                label: Text('Fooditem'),
              ),
              Forms(
                label: Text('Prefered Time'),
              ),
              Forms(
                label: Text('Pickup Day'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Quantity : ' + '$person' + ' Person',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SliderTheme(
                  data: SliderThemeData(
                      thumbColor: Colors.amber,
                      activeTrackColor: Colors.amber,
                      inactiveTrackColor: Color.fromARGB(94, 255, 255, 255),
                      thumbShape: RoundSliderThumbShape(
                          disabledThumbRadius: 20, enabledThumbRadius: 10)),
                  child: Slider(
                    min: 1,
                    max: 10000,
                    value: person.toDouble(),
                    onChanged: (double val) {
                      setState(() {
                        person = val.toInt();
                        print(person);
                      });
                    },
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print('Submitted');

                      final snackBar = SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            'Succesfully Submitted',
                            style: TextStyle(color: Colors.blue),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
