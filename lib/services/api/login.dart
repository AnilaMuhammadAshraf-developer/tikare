import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tikare/constants/api_constants.dart';
import 'package:tikare/models/user_model.dart';
import 'package:tikare/utils/helper..dart';


class LoginService {
  Future<UserModel?> loginByEmail(String email) async {
     final String? deviceToken = await Helper.getToken();
    final String? deviceType = await Helper.getDeviceType();
    print("device type: $deviceType");
    print("device token: $deviceToken");
    final url=Uri.parse(ApiConstants.emailLoginEndpoint);
    final body={
      'email':email,
      'device_token':deviceToken,
      'device_type':deviceType
    };
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body:jsonEncode(body)
    );
       
    if (response.statusCode == 200) {
      print("this is response code: ${response.statusCode}");
     final data = jsonDecode(response.body);
    final userData = data['data']['user'];

      if (userData != null) {
        return UserModel.fromJson(userData);
      } else {
        return null;
      }
     
      
    } else {
      throw Exception('Failed to login.');
    }
  }
}
