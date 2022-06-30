import 'package:shadow/models/loginmodel.dart';

import 'package:shared_preferences/shared_preferences.dart';

void savedlogin(LoginModel LoginMo) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('name', LoginMo.data!.name ?? "");
  prefs.setString('email', LoginMo.data!.email ?? "");
  prefs.setString('firstname', LoginMo.data!.firstName ?? "");
  prefs.setString('lastname', LoginMo.data!.lastName ?? "");
  prefs.setString('gender', LoginMo.data!.gender ?? "");
  prefs.setString('phone', LoginMo.data!.phone ?? "");
  prefs.setString('dob', LoginMo.data!.dateOfBirth ?? "");
  prefs.setString('status', LoginMo.data!.status ?? "");
}

