import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  File? pickedImage;
  void imagePickerOption() {
    Get.bottomSheet(
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            height: 100,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  pickImage(ImageSource.camera);
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.camera,
                      size: 70,
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 80,
              ),
              GestureDetector(
                onTap: () {
                  pickImage(ImageSource.gallery);
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.photo,
                      size: 70,
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  color: Colors.white,
                  child: Image.asset(
                    'images/DonationBanner.png',
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 130,
                  child: GestureDetector(
                      onTap: imagePickerOption,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 65, 7),
                        radius: 54,
                        child: Container(
                            height: 100,
                            width: 100,
                            child: ClipOval(
                                child: pickedImage != null
                                    ? Image.file(
                                        pickedImage!,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.asset('images/profile.jpg'))),
                      )),
                )
              ]),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Afraz Hasan Naqvi',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'PatrickHand',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Member from 2019',
              style: TextStyle(
                color: Color.fromARGB(255, 142, 142, 142),
                fontSize: 13,
                fontFamily: 'Amaranth',
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Image.asset(
              'images/friends1.png',
            )
          ],
        ),
      ),
    );
  }
}
