import 'package:shared_preferences/shared_preferences.dart';
class TokenStorage{

 static Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('fcm_token', token);
 }
 
 static Future<String?> getToken()async{
   final prefs = await SharedPreferences.getInstance();
   return prefs.getString('fcm_token');
 }
}