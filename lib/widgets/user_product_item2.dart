import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shop_app_refactored/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class userProductItem2 extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  userProductItem2({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: GridTile(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Image.network(
            imageUrl,
            fit: BoxFit.scaleDown,
          ),
        ),
        header: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(title),
        ),
        footer: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Color(0xff222831),
                ),
                onPressed: () async {
                  print('id is ' + id);

                  var productsData; //TODO INITIALIZE

                  print('poddata len' + productsData.length.toString());
                  Navigator.of(context)
                      .pushNamed(EditProductScreen.routeName, arguments: id);
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  //TODO DELETE
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content:
                        Text('some thing went wrong cant delete the product'),
                  ));

                  print('done@@@@@@@@@@@@@');
                },
                color: Theme.of(context).errorColor,
              ),
            ]),
      ),
    );
  }
}
