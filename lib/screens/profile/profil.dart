import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/models/users.dart';
import 'package:flutter_shop_app_refactored/providers/bottomNavigationBarProvider.dart';
import 'package:flutter_shop_app_refactored/screens/profile/ProfileCubit.dart';
import 'package:flutter_shop_app_refactored/screens/profile/ProfileState.dart';
import 'package:flutter_shop_app_refactored/style.dart';
import 'package:flutter_shop_app_refactored/widgets/commonWidgets.dart';
import 'package:flutter_shop_app_refactored/widgets/user_product_item2.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
    var selectedPageIndex =
        Provider.of<BottomNavigationBarProvider>(context).selectedPageIndex;

    final devicesize = MediaQuery.of(context).size;
    return Consumer<BottomNavigationBarProvider>(
        builder: (ctx, p, _) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: SizedBox(
                  height: devicesize.height,
                  child: BlocConsumer<ProfileCubit, profileState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var cubit = ProfileCubit.get(context);

                      return state is LoadingState
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                SizedBox(
                                  height: devicesize.height * .15,
                                  child: Container(
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/profile.png')),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Text(
                                    cubit.CurrentUser.name,
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Center(
                                              child: SizedBox(
                                                  height:
                                                      devicesize.height * .5,
                                                  width: double.infinity,
                                                  child: Card(
                                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30))),
                                                    color: backgroundColor,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(12),
                                                                child: Text(
                                                                  'Your info',
                                                                  style: TextStyle(
                                                                      color:
                                                                          thierdltColor,
                                                                      fontSize:
                                                                          24,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Spacer(),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Icon(
                                                                    Icons.edit),
                                                              )
                                                            ],
                                                          ),
                                                          Divider(),
                                                          Form(
                                                            key: cubit.formKey,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                CustomInputFilde(
                                                                    'Name',
                                                                    cubit
                                                                        .CurrentUser
                                                                        .name,
                                                                    devicesize,
                                                                    cubit
                                                                        .nameController,
                                                                    context),
                                                                CustomInputFilde(
                                                                    'Email',
                                                                    cubit
                                                                        .CurrentUser
                                                                        .email,
                                                                    devicesize,
                                                                    cubit
                                                                        .emailController,
                                                                    context),
                                                                CustomInputFilde(
                                                                    'Phone',
                                                                    cubit
                                                                        .CurrentUser
                                                                        .phone,
                                                                    devicesize,
                                                                    cubit
                                                                        .phoneController,
                                                                    context),
                                                                CustomInputFilde(
                                                                    'Address',
                                                                    'Cairo Egypt ',
                                                                    devicesize,
                                                                    cubit
                                                                        .adreessController,
                                                                    context)
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 50,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: FloatingActionButton(
                                            onPressed: () {
                                              print(cubit.nameController.text
                                                  .toString());
                                              cubit.save();
                                            },
                                            child: Text(
                                              'Ok',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            backgroundColor: thierdltColor,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                ),
              ),
              bottomNavigationBar: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  child: BottomNavigationBar(
                    onTap: Provider.of<BottomNavigationBarProvider>(context)
                        .changeNavBar,
                    backgroundColor: Theme.of(context).primaryColor,
                    selectedItemColor: HexColor('#222831'),
                    currentIndex: selectedPageIndex,
                    // type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        backgroundColor: HexColor('#f1d2c5'),
                        icon: selectedPageIndex == 0
                            ? Icon(Icons.home)
                            : Icon(Icons.home_outlined),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: HexColor('#f1d2c5'),
                        icon: selectedPageIndex == 1
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: HexColor('#f1d2c5'),
                        icon: selectedPageIndex == 2
                            ? Icon(Icons.person)
                            : Icon(Icons.person_outlined),
                        label: 'Profile',
                      ),
                    ],
                  )),
            ));
  }
}
