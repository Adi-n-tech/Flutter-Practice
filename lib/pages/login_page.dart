import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeBtn = false;
  String password = "";
  final _formKey = GlobalKey<FormState>();

  moveToHome() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeBtn = !changeBtn;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.home);
      setState(() {
        changeBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (text) {
                        name = text;
                        setState(() {});
                      },
                      validator: (value) {
                        (value == null || value.isEmpty)
                            ? "username should not empty"
                            : null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                    ),
                    TextFormField(
                      obscureText: true,
                      onChanged: (text) {
                        password = text;
                      },
                      validator: (value) {
                        (value == null || value.isEmpty)
                            ? "password should not empty"
                            : null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () => moveToHome(),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: changeBtn ? 50 : 50,
                        width: changeBtn ? 50 : 120,
                        alignment: Alignment.center,
                        child: changeBtn
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(changeBtn ? 26 : 10),
                            color: Colors.orange),
                        // borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.home);
                    //   },
                    //   style: TextButton.styleFrom(
                    //       padding: EdgeInsets.fromLTRB(25, 5, 25, 5)),
                    //   child: Text(
                    //     "Login",
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "I dont have an account ?",
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
