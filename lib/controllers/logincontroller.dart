import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/loginmodel.dart';
import '../properties/config.dart';

class loginController {
  login(String username, String password) async {
    var body = jsonEncode({"email": username, "password": password});

    try {
      var url = Uri.parse(Host + "/api/customer/login");
      var response = await http.post(url, body: body, headers: {
        "Content-Type": "application/json",
      });
      log(response.body);

      if (response.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        return false;
      }
    } on Exception catch (e) {
      log("Something Wents Wrong" + e.toString());

      return false;
    }
  }
}

