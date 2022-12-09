import 'package:api_lession/data_sources/api_service.dart';
import 'package:api_lession/resources/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import '../models/user.dart';
class UserVM with ChangeNotifier  {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  User? user;

  updateUserInformation({required User user}) async {
      this.user = user;
      notifyListeners();
    }


  }



