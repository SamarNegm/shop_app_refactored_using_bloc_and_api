import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/models/ProductModel.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/CartCubit.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/CartState.dart';
import 'package:flutter_shop_app_refactored/screens/Home/HomeState.dart';
import 'package:flutter_shop_app_refactored/screens/Home/homeCubit.dart';
import 'package:flutter_shop_app_refactored/style.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final bool isFav;

  const ProductItem({Key key, this.product, this.isFav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product,
            );
          },
          child: Hero(
            tag: product.id,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Theme.of(context).accentColor,
                width: 5,
              )),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.height * .2,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
        ),
        header: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff222831),
            ),
          ),
        ),
        footer: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return GridTileBar(
              // backgroundColor: Colors.black26,
              //    leading: Text('$'+product.price.toString()),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$${product.price}',
                  style: TextStyle(
                      color: thierdltColor, fontWeight: FontWeight.bold),
                ),
              ),

              title: Text(
                '',
                textAlign: TextAlign.center,
              ),
              trailing: BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cartCubit = CartCubit.get(context);
                  return IconButton(
                    icon: Icon(
                      product.in_cart
                          ? Icons.shopping_cart
                          : Icons.shopping_cart_outlined,
                      color: product.in_cart
                          ? thierdltColor
                          : Theme.of(context).accentColor,
                    ),
                    onPressed: () {
                      cartCubit.ToggelCart(product);

                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Added item to cart!',
                          ),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              //todo remove
                              //cart.removeSingleItem(product.id.toString());
                            },
                          ),
                        ),
                      );
                    },
                    color: Color(0xff222831),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
