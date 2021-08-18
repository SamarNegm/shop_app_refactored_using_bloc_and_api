import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/models/ProductModel.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/CartCubit.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/CartState.dart';

class CartItem extends StatelessWidget {
  final ProductModel model;
  final int quantity;

  CartItem(this.model, this.quantity);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = CartCubit.get(context);
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Theme.of(context).errorColor,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 4,
                ),
              ),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text(
                      'Do you want to remove the item from the cart?',
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                      ),
                      TextButton(
                        child: Text('Yes'),
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                      ),
                    ],
                  ),
                );
              },
              onDismissed: (direction) {
                cubit.ToggelCart(model);
                cubit.getCartData();
              },
              child: Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 4,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Container(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Image.network(model.image),
                        ),
                      ),
                    ),
                    title: Text(model.name),
                    subtitle: Text('Total: \$${(model.price * quantity)}'),
                    trailing: Text('$quantity x'),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
