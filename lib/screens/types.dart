import 'package:flutter/material.dart';
import 'package:flutter_shop_app_refactored/models/ProductModel.dart';
import 'package:flutter_shop_app_refactored/screens/edit_product_screen.dart';

class Types extends StatelessWidget {
  static const routeName = '/types';
  var _editedProduct;
  @override
  Widget build(BuildContext context) {
    _editedProduct = ModalRoute.of(context).settings.arguments as ProductModel;
    return Scaffold(
      body: ListView.separated(
          itemBuilder: TypeCreator,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: 3),
    );
  }

  Widget TypeCreator(BuildContext context, int index) {
    return ListTile(
      title: Text('item $index'),
      onTap: () {
        _editedProduct = ProductModel(
          name: _editedProduct.title,
          price: _editedProduct.price,
          description: _editedProduct.description,
          image: _editedProduct.imageUrl,
          id: _editedProduct.id,
          in_favorites: _editedProduct.isFavorite,
          //   type: 'item $index'
        );
        print(_editedProduct.title + ' ' + _editedProduct.type);

        Navigator.pushNamed(context, EditProductScreen.routeName,
            arguments: [_editedProduct.id, _editedProduct]);
      },
    );
  }
}
