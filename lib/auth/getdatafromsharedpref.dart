import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getuserID() async {
  final prefs = await SharedPreferences.getInstance();
  final userUid = await prefs.getString("id");
  if (userUid == null) {
    return "user null";
  }

  print(userUid);
  return userUid;
}

Future<String> getuserName() async {
  final prefs = await SharedPreferences.getInstance();
  final userName = await prefs.getString("username");
  if (userName == null) {
    return "user null";
  }

  print(userName);
  return userName;
}

Future<String> getuserProfileImage() async {
  final prefs = await SharedPreferences.getInstance();
  final userProfile = await prefs.getString("photourl");
  if (userProfile == null) {
    return "user null";
  }

  print(userProfile);
  return userProfile;
}
