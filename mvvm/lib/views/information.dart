import 'package:api_lession/data_sources/api_service.dart';
import 'package:api_lession/view_models/user_vm.dart';
import 'package:api_lession/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
class Information extends StatelessWidget {

  Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserVM userVM = Provider.of<UserVM>(context);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Thông tin"),
                Text("${userVM.user!.name}")

              ],
            )
        ),
      ),
    );
  }
}
