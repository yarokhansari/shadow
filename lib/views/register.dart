import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shadow/controllers/registercontroller.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  static String rName= '/register';

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cnfpassword = TextEditingController();

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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Flexible(
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                  child: TextField(
                      controller: firstname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "First Name",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                        prefixIcon: Icon(Icons.person_outline),
                      )),
                ),
              ),
              Flexible(
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                  child: TextField(
                      controller: lastname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Last Name",
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                        prefixIcon: Icon(Icons.person_outline),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
              child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Email Address",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    prefixIcon: Icon(Icons.person_outline),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
              child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    prefixIcon: Icon(Icons.person_outline),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
              child: TextField(
                  controller: cnfpassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                    prefixIcon: Icon(Icons.person_outline),
                  )),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
              onPressed: () async {
                loading();

                await registerController().register(
                    firstname.text, lastname.text, email.text, password.text, cnfpassword.text);
                Navigator.of(context).pop();
              },
              child: Text(
                "login",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ],
      ),
    );
  }
}
