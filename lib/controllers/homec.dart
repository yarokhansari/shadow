import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shadow/Global/Properties/config.dart';
import 'package:shadow/models/homem.dart';

class homec {
  Future<Homem?> homef() async {
    try {
      var url = Uri.parse(Host + '/api/HomeScreen');
      var response = await http.get(url, headers: {
        "Content-Type": "application/json",
      });
      log(response.body);

      if (response.statusCode == 200) {
        return Homem.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } on Exception catch (e) {
      log("Something Wents Wrong" + e.toString());

      return null;
    }
  }
}
