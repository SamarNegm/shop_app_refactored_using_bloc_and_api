import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/cart_screen.dart';
import 'package:flutter_shop_app_refactored/screens/Home/HomeState.dart';
import 'package:flutter_shop_app_refactored/screens/Home/homeCubit.dart';
import 'package:flutter_shop_app_refactored/screens/edit_product_screen.dart';
import 'package:flutter_shop_app_refactored/widgets/app_drawer.dart';
import 'package:hexcolor/hexcolor.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routName = '\overview';
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          drawer: AppDrawer(),
          body: cubit.pages[cubit.selectedPageIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: BottomNavigationBar(
              onTap: cubit.changeNavBar,
              backgroundColor: Theme.of(context).primaryColor,
              selectedItemColor: HexColor('#222831'),
              currentIndex: cubit.selectedPageIndex,
              // type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: HexColor('#f1d2c5'),
                  icon: cubit.selectedPageIndex == 0
                      ? Icon(Icons.home)
                      : Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: HexColor('#f1d2c5'),
                  icon: cubit.selectedPageIndex == 1
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  backgroundColor: HexColor('#f1d2c5'),
                  icon: cubit.selectedPageIndex == 2
                      ? Icon(Icons.person)
                      : Icon(Icons.person_outlined),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
