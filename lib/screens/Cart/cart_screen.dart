import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/CartCubit.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/CartState.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/cartModel.dart';
import 'package:flutter_shop_app_refactored/screens/Ordering.dart';
import 'package:flutter_shop_app_refactored/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CartCubit(initialCartState())..getCartData(),
      child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            print('***************');
            var totalPrice = 0;
            List<CartModel> cart = CartCubit.get(context).cartData;
            for (int i = 0; i < cart.length; i++) {
              totalPrice += cart[i].product.price;
            }
            print(cart.length.toString() + '.........');

            return Scaffold(
              body: (state is LoadingCartState)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: devicesize.height * .15,
                            child: Container(
                              child: Image(
                                  image: AssetImage('assets/images/bag.png')),
                            ),
                          ),
                          SizedBox(
                            height: devicesize.height * .57,
                            child: Container(
                              child: ListView.builder(
                                itemCount: cart.length,
                                itemBuilder: (ctx, i) =>
                                    CartItem(cart[i].product, cart[i].quantity),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: devicesize.height * .15,
                            width: double.infinity,
                            child: Card(
                              margin: EdgeInsets.all(15),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      '\$${totalPrice.toStringAsFixed(2)}',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                                height: 50,
                                width: devicesize.width,
                                child: OrderButton(totalPrice: totalPrice)),
                          )
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.totalPrice,
  }) : super(key: key);

  final totalPrice;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: _isLoading
          ? CircularProgressIndicator()
          : Text(
              'ORDER NOW',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
      onPressed: (widget.totalPrice <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              // await Provider.of<Orders>(context, listen: false).addOrder(
              //   widget.cart.items.values.toList(),
              //   widget.cart.totalAmount,
              // );
              setState(() {
                Navigator.of(context).pushNamed(Ordering.routeName);
                _isLoading = false;
              });
              widget.totalPrice.clear();
            },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      textColor: Theme.of(context).primaryColor,
      color: Theme.of(context).primaryColor,
    );
  }
}
