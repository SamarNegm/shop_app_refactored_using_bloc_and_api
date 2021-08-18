import 'package:flutter/material.dart';
import 'package:flutter_shop_app_refactored/widgets/products_grid.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ProductOverView extends StatefulWidget {
  static const routeName = '/cupsOcerView';
  final String type;

  const ProductOverView({Key key, @required this.type}) : super(key: key);
  @override
  _ProductOverViewState createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    Navigator.of(context).pushReplacementNamed('/');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: HexColor('#f1d2c5'),
          child: Container(
              child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0)),
            child: Container(
              color: Colors.white,
              child: ProductsGrid(false, widget.type),
            ),
          ))),
    );
  }
}
