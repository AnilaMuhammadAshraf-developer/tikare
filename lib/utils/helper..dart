import 'package:shared_preferences/shared_preferences.dart';
class Helper{

 static Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('fcm_token', token);
 }
 
 static Future<String?> getToken()async{
   final prefs = await SharedPreferences.getInstance();
   return prefs.getString('fcm_token');
 }
  static Future<void> saveDeviceType(String type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('device_type', type);
  }

  static Future<String?> getDeviceType() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('device_type');
  }
}