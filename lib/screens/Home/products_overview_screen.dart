import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/providers/bottomNavigationBarProvider.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/cart_screen.dart';
import 'package:flutter_shop_app_refactored/screens/Home/HomeState.dart';
import 'package:flutter_shop_app_refactored/screens/Home/homeCubit.dart';
import 'package:flutter_shop_app_refactored/screens/edit_product_screen.dart';
import 'package:flutter_shop_app_refactored/style.dart';
import 'package:flutter_shop_app_refactored/widgets/app_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

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
    var selectedPageIndex =
        Provider.of<BottomNavigationBarProvider>(context).selectedPageIndex;

    return Consumer<BottomNavigationBarProvider>(
        builder: (ctx, p, _) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: Provider.of<BottomNavigationBarProvider>(context)
                  .pages[selectedPageIndex],
            ));
  }
}
