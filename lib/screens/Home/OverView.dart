import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/providers/bottomNavigationBarProvider.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/cart_screen.dart';
import 'package:flutter_shop_app_refactored/screens/Home/HomeState.dart';
import 'package:flutter_shop_app_refactored/screens/Home/homeCubit.dart';
import 'package:flutter_shop_app_refactored/widgets/app_drawer.dart';
import 'package:flutter_shop_app_refactored/widgets/products_grid.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class OverView extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  @override
  Widget build(BuildContext context) {
    var selectedPageIndex =
        Provider.of<BottomNavigationBarProvider>(context).selectedPageIndex;

    return Consumer<BottomNavigationBarProvider>(
        builder: (ctx, p, _) => BlocProvider(
            create: (context) => HomeCubit(InitializedState())..getHomeData(),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (ctx, state) {},
              builder: (ctx, state) {
                return Scaffold(
                  drawer: AppDrawer(),
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(40.0)),
                      child: AppBar(
                        backgroundColor: HexColor('#f1d2c5'),
                        actions: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(CartScreen.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: Container(
                      color: HexColor('#f1d2c5'),
                      child: Container(
                          child: ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(40.0)),
                        child: Container(
                          color: Colors.white,
                          child: ProductsGrid(false, 'Discover'),
                        ),
                      ))),
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
                );
              },
            )));
  }
}
