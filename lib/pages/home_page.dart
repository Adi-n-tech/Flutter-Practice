import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
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
  final url = "https://api.jsonbin.io/v3/b/6371afa665b57a31e6b6b829";

  @override
  void initState() {
    loadDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () => {},
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: Column(
                children: [
                  Text(
                    "Trending Mobiles",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    "Brand New Mobile Phones",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              )),
          Expanded(
            child: products.isNotEmpty
                ? ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductWidget(
                        product: products[index],
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  void loadDataFromApi() async {
    Map<String, String> header = Map();
    header["X-Access-Key"] =
        "\$2b\$10\$ANT.2crUwp3FJmrEL1jkk.CurWloKvMDZBcTaZ3GIJrYYK0FB17Rm";
    var productJson = await http.get(Uri.parse(url), headers: header);
    var body = productJson.body;
    var decodeJson = jsonDecode(body);
    var productsData = decodeJson["record"];
    var data = productsData["products"];
    products =
        List.from(data).map<Product>((item) => Product.fromMap(item)).toList();
    setState(() {});
  }

  /*void loadDataFromStaticJson() async {
    var productJson =
        await rootBundle.loadString("assets/files/products_list.json");
    var decodeJson = jsonDecode(productJson);
    var productsData = decodeJson["products"];
    products = List.from(productsData)
        .map<Product>((item) => Product.fromMap(item))
        .toList();
    setState(() {});
  }*/
}
