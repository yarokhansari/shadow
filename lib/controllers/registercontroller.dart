import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shadow/Global/Properties/config.dart';


class registerController {
  register(
      String firstname, String lastname, String email, String password, String cnfpassword) async {
    var body = jsonEncode({
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "password": password,
      "password_confirmation": cnfpassword
    });

    try {
      var url = Uri.parse(Host + "/api/customer/register");
      print(url);
      var response = await http.post(url, body: body, headers: {
        "Content-Type": "application/json",
      });
      log(response.body);

      if (response.body != null) {
        return true;
        //jsonDecode(response.body);
      } else {
        return false;
      }
    } on Exception catch (e) {
      log("Something Wents Wrong" + e.toString());

      return false;
    }
  }
}
