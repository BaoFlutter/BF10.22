// Xử lý các nhiệm vụ của các API
import 'package:api_lession/data_sources/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService{

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

 // Đăng nhập

  Future signIn({required Map loginData})
  {
    var loginUrl = ApiUrl.loginApiUrl;
    Future response = http.post(
        loginUrl,
        body: loginData);
    return response;
  }


  Future logOut( token){
    var logOut = ApiUrl.lougOutApiUrl;
    Future response = http.delete(logOut,
        headers:{
          "Authorization" : 'Bearer ' + token,
          "Accept" : "application/json"
        });
    return response;

  }

   Future getUserInfor() async {
     SharedPreferences prefs = await _prefs;
     String? token = await prefs.getString("token");
    var userUrl = ApiUrl.getUserInfor;

    Future response = http.get(
        userUrl,
        headers:{
          "Authorization" : 'Bearer ' + token!,
          "Accept" : "application/json"
        }
    );

    return response;
  }






}