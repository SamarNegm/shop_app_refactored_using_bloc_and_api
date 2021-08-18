import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app_refactored/models/ProductModel.dart';
import 'package:flutter_shop_app_refactored/screens/Cart/cart_screen.dart';
import 'package:flutter_shop_app_refactored/screens/Home/HomeState.dart';
import 'package:flutter_shop_app_refactored/screens/Home/homeCubit.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail4';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int itemCount = 1;
  ProductModel loadedProduct = null;
  bool added = false;
  dynamic totalPrice = 0;
  var authData;
  var cart;

  @override
  void didChangeDependencies() {
    loadedProduct = ModalRoute.of(context).settings.arguments as ProductModel;
    totalPrice = loadedProduct.price;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    void incAndDecrement(int curNum, String operatin) {
      if (operatin == '+') {
        curNum++;
      } else {
        if (curNum > 1) curNum--;
      }
      print(curNum);
      setState(() {
        print('hi');
        itemCount = curNum;
        totalPrice = loadedProduct.price * itemCount;
        print('hi' + totalPrice.toString() + '  ' + itemCount.toString());
      });
    }

    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          SizedBox(
              height: deviceSize.height * .8,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: deviceSize.height * .5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          child: Card(
                            elevation: 1,
                            shadowColor: Colors.black,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .7,
                                            child: Expanded(
                                              child: Text(
                                                loadedProduct.name,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: BlocConsumer<HomeCubit,
                                              HomeState>(
                                            listener: (context, state) {},
                                            builder: (context, state) {
                                              var cubit =
                                                  HomeCubit.get(context);
                                              return IconButton(
                                                icon: Icon(
                                                  loadedProduct.in_favorites
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                ),
                                                iconSize:
                                                    deviceSize.height * .05,
                                                onPressed: () {
                                                  cubit.ToggelFavorit(
                                                      loadedProduct);
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30.0,
                                        right: 20,
                                        bottom: 8,
                                        top: 0),
                                    child: SizedBox(
                                      height: deviceSize.height * .2,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Hero(
                                            tag: loadedProduct.id,
                                            child: Container(
                                              height: deviceSize.height * .2,
                                              width: deviceSize.height * .2,
                                              child: Image.network(
                                                loadedProduct.image,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      loadedProduct.description,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(fontSize: 35),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, top: 12, bottom: 12),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: FittedBox(
                                    child: Text(
                                      '$totalPrice',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: FloatingActionButton(
                                            onPressed: () =>
                                                incAndDecrement(itemCount, '+'),
                                            heroTag: 'f1',
                                            child: Text(
                                              '+',
                                              style: TextStyle(fontSize: 25),
                                            ),

                                            //highlightElevation: deviceSize.height * .0150
                                          ),
                                          height: deviceSize.height * .07,
                                        ),
                                        Container(
                                          child: Text(
                                            '    ',
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ),
                                        Container(
                                          child: FloatingActionButton(
                                            onPressed: () =>
                                                incAndDecrement(itemCount, '-'),
                                            heroTag: 'f2',
                                            child: Text(
                                              '-',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ),
                                          height: deviceSize.height * .07,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ])),
                    ]),
              )),
          added
              ? Row(
                  children: [
                    Text('Item added to chart'),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          child: Text(
                            'Open',
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(CartScreen.routeName);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          color: Theme.of(context).primaryColor,
                          textColor:
                              Theme.of(context).primaryTextTheme.button.color,
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: RaisedButton(
                        child: Text(
                          'Add to chart',
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                        onPressed: () {
                          print(totalPrice);
                          cart.addItem(
                              loadedProduct.id,
                              totalPrice,
                              loadedProduct.name,
                              itemCount,
                              loadedProduct.image);
                          setState(() {
                            added = true;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                        color: Theme.of(context).primaryColor,
                        textColor:
                            Theme.of(context).primaryTextTheme.button.color,
                      ),
                    ),
                  ),
                ),
        ]));
  }

  @override
  void initState() {
    // loadedProduct = Provider.of<Products>(
    //   context,
    //   listen: true,
    // ).findById(productId);
    // totalPrice = loadedProduct.price;
  }
}
