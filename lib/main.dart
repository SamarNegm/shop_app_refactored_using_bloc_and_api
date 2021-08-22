import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/network/local/cache_helper.dart';
import 'package:flutter_shop_app_refactored/network/remote/DioHelper.dart';
import 'package:flutter_shop_app_refactored/providers/bottomNavigationBarProvider.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/CartCubit.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/CartState.dart';
import 'package:flutter_shop_app_refactored/screens/CreditCard.dart';
import 'package:flutter_shop_app_refactored/screens/EditProfile.dart';
import 'package:flutter_shop_app_refactored/screens/Home/HomeState.dart';
import 'package:flutter_shop_app_refactored/screens/Home/homeCubit.dart';
import 'package:flutter_shop_app_refactored/screens/Home/products_overview_screen.dart';
import 'package:flutter_shop_app_refactored/screens/OnBoardingScreen.dart';
import 'package:flutter_shop_app_refactored/screens/Ordering.dart';
import 'package:flutter_shop_app_refactored/screens/ProductOverView.dart';
import 'package:flutter_shop_app_refactored/screens/ProductType.dart';
import 'package:flutter_shop_app_refactored/screens/auth/authCubit.dart';
import 'package:flutter_shop_app_refactored/screens/auth/authState.dart';
import 'package:flutter_shop_app_refactored/screens/auth/auth_screen.dart';
import 'package:flutter_shop_app_refactored/screens/profile/ProfileCubit.dart';
import 'package:flutter_shop_app_refactored/screens/profile/ProfileState.dart';
import 'package:flutter_shop_app_refactored/screens/profile/profil.dart';
import 'package:flutter_shop_app_refactored/screens/types.dart';
import 'package:flutter_shop_app_refactored/style.dart';
import 'package:provider/provider.dart';

import './screens/edit_product_screen.dart';
import './screens/orders_screen.dart';
import './screens/product_detail_screen.dart';
import 'screens/Cart/cart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await await CacheHelper.init();
  await DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isFirst = (CacheHelper.getData(key: 'isFirst') ?? true);
    var isAuth = (CacheHelper.getData(key: 'token')) == null ? false : true;
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => ShopLoginCubit()),
        BlocProvider(
            create: (context) => HomeCubit(InitializedState())..getHomeData()),
        BlocProvider(
            create: (context) =>
                ProfileCubit(InitialProfileState())..geProfileData()),
        BlocProvider(create: (context) => CartCubit(initialCartState())),
        ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider())
      ],
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.red,
            primaryColor: defultColor,
            accentColor: secondltColor,
            fontFamily: 'Lato',
          ),
          home: isFirst
              ? OnBoardingScreen()
              : isAuth
                  ? ProductsOverviewScreen()
                  : AuthScreen(),
          // : FutureBuilder(
          //     future: auth.tryAutoLogin(),
          //     builder: (ctx, snapshot) =>
          //         snapshot.connectionState == ConnectionState.waiting
          //             ? SplashScreeen()
          //             : AuthScreen(),
          //   ),

          routes: {
            ProductsOverviewScreen.routName: (ctx) => ProductsOverviewScreen(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            Types.routeName: (ctx) => Types(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            ProductType.routeName: (ctx) => ProductType(),
            ProductOverView.routeName: (ctx) => ProductOverView(
                  type: '',
                ),
            Ordering.routeName: (ctx) => Ordering(),
            profile.routeName: (ctx) => profile(),
            EditProfile.routeName: (ctx) => EditProfile(),
            CreditCard.routeName: (ctx) => CreditCard(),
          },
        ),
      ),
    );
  }
}
