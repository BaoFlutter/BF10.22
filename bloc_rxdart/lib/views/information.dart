import 'package:api_lession/blocs/user_infor_bloc.dart';
import 'package:api_lession/data_sources/api_service.dart';
import 'package:api_lession/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'dart:convert' as convert;

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {

  final UserInforBloc userInforBloc = UserInforBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
          stream: userInforBloc.encodedUserInforStream ,
          builder: (context, snapshot){
            // load loi
            if(snapshot.hasError) return Center(
              child: Text("Load Error !")
            );
            // Load chua xong
            if(!snapshot.hasData) return Center(
              child: CircularProgressIndicator()
            );
            var encodedUserInfor = snapshot.data!;

            Map infor = convert.jsonDecode(encodedUserInfor.body);

            if(infor['status'] == "success")  {
              Map userData = infor['data'];
              return Column(
                children: [
                  Text("Information"),
                  Text(userData['name'])
                ],
              );


            }
            else return Column(
              children: [
                Text("Khong lay duoc thong tin"),

              ],
            );



          }
        )
      ),
    );
  }
}
