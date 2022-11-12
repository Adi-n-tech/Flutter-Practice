import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/widgets/Drawer.dart';

import '../model/Product.dart';
import '../widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = List.empty();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return products.isNotEmpty
              ? ProductWidget(
                  product: products[index],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
      drawer: MyDrawer(),
    );
  }

  void loadData() async {
    var productJson =
        await rootBundle.loadString("assets/files/products_list.json");
    var decodeJson = jsonDecode(productJson);
    var productsData = decodeJson["products"];
    products = List.from(productsData)
        .map<Product>((item) => Product.fromMap(item))
        .toList();
    setState(() {});
  }
}
