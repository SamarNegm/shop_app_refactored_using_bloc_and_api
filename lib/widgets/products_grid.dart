import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/screens/Home/HomeState.dart';
import 'package:flutter_shop_app_refactored/screens/Home/homeCubit.dart';

import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  String type;
  ProductsGrid(this.showFavs, @required this.type);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        dynamic products = cubit.productsData;

        return state is LoadingState
            ? Center(child: CircularProgressIndicator())
            : state is ErrorState
                ? Center(child: Text('Error Happened'))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 20, bottom: 8),
                        child: Text(
                          type,
                          style: TextStyle(fontFamily: 'NIRVANA', fontSize: 32),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemCount:
                              showFavs ? cubit.favData.length : products.length,
                          itemBuilder: (ctx, i) => ProductItem(
                              product:
                                  (showFavs ? cubit.favData[i] : products[i]),
                              isFav: showFavs),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                        ),
                      ),
                    ],
                  );
      },
    );
  }
}
