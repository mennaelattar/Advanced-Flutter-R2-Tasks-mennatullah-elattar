import 'package:flutter/material.dart';
import 'package:day_3/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModelView extends ChangeNotifier {
  late String Usernamedata;
  late String PasswordData;

  login(String username, String password) async {
    Usernamedata = username;
    PasswordData = password;
    if (Usernamedata != null && PasswordData != null) {
      SharedPreferences shPref = await SharedPreferences.getInstance();
      shPref.setString("login", "true");
    }
    notifyListeners();
  }

  getUsername() {
    return Usernamedata;
  }
}
