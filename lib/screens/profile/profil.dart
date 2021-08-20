import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shop_app_refactored/style.dart';
import 'package:flutter_shop_app_refactored/widgets/commonWidgets.dart';
import 'package:flutter_shop_app_refactored/widgets/user_product_item2.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class profile extends StatefulWidget {
  static const routeName = '/profile';
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: devicesize.height,
        child: Column(
          children: [
            SizedBox(
              height: devicesize.height * .15,
              child: Container(
                child: Image(image: AssetImage('assets/images/profile.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Eman Salah',
                style: TextStyle(
                  color: thierdltColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: devicesize.height * .52,
              width: double.infinity,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: SizedBox(
                              height: devicesize.height * .5,
                              width: double.infinity,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                color: backgroundColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            'Your info',
                                            style: TextStyle(
                                                color: thierdltColor,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.edit),
                                        )
                                      ],
                                    ),
                                    Divider(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomInputFilde('Name', devicesize),
                                        CustomInputFilde('Email', devicesize),
                                        CustomInputFilde('Phone', devicesize),
                                        CustomInputFilde('Address', devicesize)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: FloatingActionButton(
                        onPressed: () {},
                        child: Text(
                          'Ok',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: thierdltColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
