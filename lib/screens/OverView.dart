import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/screens/Home/HomeState.dart';
import 'package:flutter_shop_app_refactored/screens/Home/homeCubit.dart';
import 'package:flutter_shop_app_refactored/widgets/products_grid.dart';
import 'package:hexcolor/hexcolor.dart';

class OverView extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(InitializedState())..getHomeData(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (ctx, state) {},
          builder: (ctx, state) {
            return Scaffold(
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
            );
          },
        ));
  }
}