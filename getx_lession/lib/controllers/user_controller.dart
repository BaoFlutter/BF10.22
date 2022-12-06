import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController {

  User? user;

  updateUserController({ required User user})
  {
    this.user = user;
    update();
  }

}