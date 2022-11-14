import 'package:flutter/material.dart';
import 'package:my_first_app/model/Product.dart';

import '../utils/Utility.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: Key(product.id.toString()),
                child: Container(
                  decoration: BoxDecoration(
                      color: Utility.gray,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70))),
                  padding: EdgeInsets.all(20),
                  child: Image.network(product.image),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  product.name,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  product.desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              Container(
                child: Text(
                  "\$${product.price}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.center,
                child: InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        child: Text(
                          "Buy",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.indigo))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
