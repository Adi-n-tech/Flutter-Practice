import 'package:flutter/material.dart';
import 'package:my_first_app/model/Product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Image.network(product.image),
        title: Text(product.name),
        subtitle: Text(product.desc),
        trailing: Text(
          "\$ ${product.price}",
          style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
    );
  }
}
