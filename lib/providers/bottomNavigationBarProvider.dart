import 'package:flutter/cupertino.dart';
import 'package:flutter_shop_app_refactored/screens/Home/OverView.dart';
import 'package:flutter_shop_app_refactored/screens/favorites.dart/Favorits.dart';
import 'package:flutter_shop_app_refactored/screens/profile/profil.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  List<Object> pages = [
    OverView(),
    Favorits(),
    profile(),
  ];
  int selectedPageIndex = 0;
  Future<void> selectPage(int index) async {
    selectedPageIndex = index;
    print(selectedPageIndex);
  }

  void changeNavBar(int index) {
    print('click');
    selectPage(index);
    notifyListeners();
  }
}
