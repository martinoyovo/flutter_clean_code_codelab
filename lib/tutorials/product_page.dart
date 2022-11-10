import 'package:flutter/material.dart';

class ProductPage1 extends StatelessWidget {
  const ProductPage1({Key? key, required this.name, required this.price}) : super(key: key);

  final List<String> name; //5
  final List<double> price; //6

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i<name.length; i++)
          ListTile(
            title: Text(name[i]),
            trailing: Text(price[i].toString()),
          )
      ],
    );
  }
}

class ProductPage2 extends StatelessWidget {
  const ProductPage2({Key? key, required this.products}) : super(key: key);

  final List<ProductDetails> products;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var product in products)
          ListTile(
            title: Text(product.product),
            trailing: Text(product.price.toString()),
          )
      ],
    );
  }
}

class ProductDetails {
  final String product;
  final String price;

  ProductDetails({required this.product, required this.price});
}
