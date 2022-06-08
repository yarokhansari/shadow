import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shadow/controllers/logincontroller.dart';
import 'package:shadow/models/loginmodel.dart';
import 'package:shadow/saved/savedlogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool showPassword = true;
  void loading() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: CircularProgressIndicator(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style:
                  TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.grey.shade500),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Enter Username",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    suffixIcon: Icon(Icons.people),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: TextField(
                  controller: password,
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.password),
                      onPressed: () => {
                        setState(() {
                          showPassword = showPassword ? false : true;
                        })
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.94,
              child: Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                      onPressed: () async {
                        loading();
                        LoginModel loginMo;

                        loginMo = await loginController().login(username.text, password.text);
                        savedlogin(loginMo);
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "login",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                      onPressed: () async {
                        //loading();
                        //LoginModel loginMo;

                        //loginMo = await loginController().login(username.text, password.text);
                        //savedlogin(loginMo);
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
