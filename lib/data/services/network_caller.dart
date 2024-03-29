import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import '../models/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url),
        // headers: {'token' : AuthUtility.userInfo.token.toString()});
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['msg'] == 'success') {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        //_gotoLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      log(body.toString());
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          //'token' : AuthUtility.userInfo.token.toString()
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          _gotoLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<void> _gotoLogin() async {
    // await AuthUtility.clearUserInfo();
    // Navigator.pushAndRemoveUntil(
    //     TaskManagerApp.globalKey.currentContext!,
    //     MaterialPageRoute(builder: (context) => const LoginScreen()),
    //         (route) => false);
  }
}
