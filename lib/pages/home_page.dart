import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/Drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Text(
          "Hello",
          style: TextStyle(
              color: Colors.blue, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
