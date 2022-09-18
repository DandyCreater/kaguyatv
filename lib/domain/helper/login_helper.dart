import 'dart:convert';

import 'package:eko_projects/domain/model/login/login_model.dart';
import 'package:flutter/services.dart';

class LoginHelper {
  Future<String?> loginFunction(String username, String password) async {
    String result = "Process Data";
    String user = "user";
    String pass = "pass";
    final jsonData = await rootBundle.loadString("assets/json/user.json");
    final decodeData = jsonDecode(jsonData);
    var loginData = OkContent.fromJson(decodeData["OKContent"]);
    print(jsonEncode(loginData));

    List<User>? oldData = loginData.user;
    List<User>? newData = [];

    var check = oldData!
        .where((element) =>
            element.username!.toLowerCase().contains(username) &&
            element.password!.toLowerCase().contains(password))
        .toList();

    for (var items in check) {
      newData.add(items);
    }

    for (var loginItem in newData) {
      user = loginItem.username.toString();
      pass = loginItem.password.toString();
    }
    print("ini User $user");
    print("Ini Password $pass");

    if (username != user && password != pass) {
      var field = "Username / Password Salah";
      result = field;
      print("INI Result $result");
    } else if (username.isEmpty && password.isEmpty) {
      var field = "Username / Password tidak boleh kosong";
      result = field;
      print("INI Result $result");
    } else {
      result = "Login Berhasil";
      print("INI Result $result");
    }
    print("INI Result $result");
    return result;
  }
}
