import 'package:shared_preferences/shared_preferences.dart';

Future<void> setToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("Token", token);
}

Future<String?> getToken() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("Token");
}

Future<void> clearToken() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}