import 'package:api_lession/data_sources/api_service.dart';
import 'package:api_lession/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
class HomeScreen extends StatelessWidget {
   final User user;
   HomeScreen({Key? key, required this.user}) : super(key: key);

   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Đăng nhập thành công!"),
              Text("Xin chào: ${user.name}"),
              TextButton(
                onPressed: () async {
                  SharedPreferences prefs = await _prefs;
                  String? token = await prefs.getString("token");
                  ApiService().logOut(token);

                  var route = MaterialPageRoute(builder: (context)=>MainScreen() );
                  Navigator.pushReplacement(context, route);
                },
                child: Text("Log out"),
              )
            ],
          )
        ),
      ),
    );
  }
}
