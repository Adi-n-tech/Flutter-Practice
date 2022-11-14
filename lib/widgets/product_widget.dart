import 'package:flutter/material.dart';
import 'package:my_first_app/model/Product.dart';
import 'package:my_first_app/pages/product_details.dart';
import 'package:my_first_app/utils/Utility.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  // Product List view widget

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return InkWell(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product)))
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Hero(
                  tag: Key(product.id.toString()),
                  child: Container(
                    alignment: AlignmentDirectional.centerStart,
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Utility.gray,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Image.network(product.image),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          product.desc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${product.price}",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.topRight,
                              child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                      child: Text(
                                        "Buy",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.orange))),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
