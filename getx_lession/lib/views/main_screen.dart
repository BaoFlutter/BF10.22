import 'package:api_lession/controllers/user_controller.dart';
import 'package:api_lession/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_sources/api_service.dart';
import '../models/user.dart';
import '../resources/widgets/input_field.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'dart:convert' as convert;

import 'home_screeen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  TextEditingController? emailController, passwordController ;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {

    //UserProvider userProvider = context.read<UserProvider>();
    //UserProvider userProvider = Provider.of<UserProvider>(context);

    final userController = Get.put(UserController());

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // email Text Field
                InputField(labelText: "Email", controller: emailController!),
                const SizedBox(height: 10,),
                // Password TextField
                InputField(labelText: "Password", controller: passwordController!),

                ElevatedButton(
                    onPressed: () async {
                      // login
                      Map loginData = {
                        'email': emailController!.text,
                        'password': passwordController!.text
                      };

                      var decodeData;

                      try {
                        Future loginResponse = ApiService().signIn(loginData: loginData);
                        decodeData = await loginResponse;
                      }
                      catch(e){
                        print(e);
                      }

                      var jsonData = convert.jsonDecode(decodeData.body);

                      if(jsonData['status']=='success') {

                        String token = jsonData['token'];
                        Map informationUser = jsonData['data'];
                        User user = User.fromJson(informationUser);

                        userController.updateUserController(user: user);

                        //userProvider.updateUserInformation(user: user);



                        SharedPreferences pref = await _prefs;
                        await pref.setString("token", token);

                        var route = MaterialPageRoute(builder: (context)=>HomeScreen(user: user,) );
                        Navigator.push(context, route);

                      }

                      else {
                        final snackBar = SnackBar(
                          content: const Text('Đăng nhập lỗi'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }






                    },
                    child: Text("Sign In"))



              ],
            ),
          ),
        ),

      ),
    );
  }
}
