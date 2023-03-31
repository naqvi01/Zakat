import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:imagecompresser/clothesdonationform.dart';
import 'package:imagecompresser/donateclothes.dart';
import 'package:imagecompresser/donatefood.dart';
import 'package:imagecompresser/fooddonationform.dart';
import 'package:imagecompresser/navigationbarbottom.dart';
import 'package:imagecompresser/signup.dart';
import 'package:imagecompresser/splashscreen.dart';
import 'package:imagecompresser/tracksubscription.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/0screen': (BuildContext context) => LoginScreen(),
        '/1screen': (BuildContext context) => SignUpScreen(),
        '/2screen': (BuildContext context) => BottomNavigation(),
        '/3screen': (BuildContext context) => DonateClothes(),
        '/4screen': (BuildContext context) => DonateFoods(),
        '/5screen': (BuildContext context) => TrackSubscription(),
        '/6screen': (BuildContext context) => FoodDonationForm(),
        '/7screen': (BuildContext context) => ClothesDonationForm(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();
  bool validate = false;
  String emailAddress = '', password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(50.0)),
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      label: Text("Email"),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      label: Text("Password"),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () async {
                    // setState(() {
                    //   if (emailcontroller.text.isNotEmpty ||
                    //       passwordcontroller.text.isNotEmpty) {
                    //     Navigator.pushNamed(context, '/2screen');
                    //   }
                    // });
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailAddress, password: password);
                      Navigator.pushNamed(context, '/2screen');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New account ?'),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/1screen'),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 251, 251, 251),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
