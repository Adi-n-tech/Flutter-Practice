import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/pages/home_page.dart';
import 'package:my_first_app/pages/login_page.dart';
import 'package:my_first_app/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.orangeAccent,
          fontFamily: GoogleFonts.macondo().fontFamily),
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.login: (context) => LoginPage()
      },
    );
  }
}
