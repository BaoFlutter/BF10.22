import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? user ;

  updateUserInformation({ required User user}){
    this.user = user;
    notifyListeners();
  }



}