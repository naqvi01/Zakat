import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String emailAddress = '', password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(50.0)),
          width: 300,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      label: Text("Name"),
                      prefixIcon: Icon(
                        Icons.person,
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
                  onChanged: (Value) {
                    emailAddress = Value!;
                  },
                  controller: emailController,
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
                  onChanged: (Value) {
                    password = Value!;
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      label: Text("Password"),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 20,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      label: Text("Confirm Password"),
                      prefixIcon: Icon(
                        Icons.lock,
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
                    // Navigator.pushNamed(context, '/0screen');
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailAddress,
                        password: password,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      } else {}
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account ?'),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/0screen'),
                    child: Text(
                      'Login',
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
