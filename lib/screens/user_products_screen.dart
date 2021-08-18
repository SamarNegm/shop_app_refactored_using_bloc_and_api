import 'package:flutter/material.dart';
import 'package:flutter_shop_app_refactored/screens/favorites.dart/Favorits.dart';
import 'package:flutter_shop_app_refactored/screens/OverView.dart';
import 'package:flutter_shop_app_refactored/screens/profil.dart';
import 'package:provider/provider.dart';

import './edit_product_screen.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatefulWidget {
  static const routeName = '/user-products';

  @override
  _UserProductsScreenState createState() => _UserProductsScreenState();
}

class _UserProductsScreenState extends State<UserProductsScreen> {
  var _isInit = true;

  var _isLoading = false;

  bool _dispose = false;
  var _showOnlyFavorites = false;
  @override
  List<Object> _pages;

  void initState() {
    _pages = [
      OverView(),
      Favorits(),
      profile(),
    ];
    super.initState();
  }

  int _selectedPageIndex = 2;

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        if (_dispose) return;

        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        print(error);
        throw error;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> refresh(BuildContext context) async {
    try {
//TODO refresh
    } catch (error) {
      print(error.toString());
      throw (error);
    }
  }

  @override
  Widget build(BuildContext context) {
    void _selectPage(int index) {
      setState(() {
        _selectedPageIndex = index;
        if (_selectedPageIndex == 1) {
          _showOnlyFavorites = true;
        } else {
          _showOnlyFavorites = false;
        }
      });
    }

    var productsData  ;//=
    print('rebilding....');
    return Scaffold(
        drawer: AppDrawer(),
        body: _pages[_selectedPageIndex],
        floatingActionButton: FloatingActionButton(
          elevation: 4.0,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Color(0xfff1d2c5),
          selectedItemColor: Color(0xff222831),
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xff1d2c5),
              icon: _selectedPageIndex == 0
                  ? Icon(Icons.home)
                  : Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff1d2c5),
              icon: _selectedPageIndex == 1
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xff1d2c5),
              icon: _selectedPageIndex == 2
                  ? Icon(Icons.person)
                  : Icon(Icons.person_outlined),
              label: 'Profile',
            ),
          ],
        ));
  }
}
