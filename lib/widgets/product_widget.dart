import 'package:flutter/material.dart';
import 'package:my_first_app/model/Product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  // Product List view widget

  @override
  Widget build(BuildContext context) {
    Color gray = Color(0xffecf0f1);

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: EdgeInsets.all(15),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: gray,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Image.network(product.image),
            ),
            Container(
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
                    style: TextStyle(fontSize: 12, color: Colors.grey),
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
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.orange))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
