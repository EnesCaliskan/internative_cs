// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internative_cs/models/users.dart';

Future<List<User>> fetchUsers(http.Client client, String token) async{
  final response = await client
      .get(
      Uri.parse('http://test11.internative.net/User/GetUsers'),
      headers: {
        //HttpHeaders.authorizationHeader: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MTI3NTRkZDRhMWMyZDM0NmNmZDk0NmQiLCJmdWxsTmFtZSI6IkVyZW4gS2F5YSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYmYiOjE2MzMyMDU4NjAsImV4cCI6MTYzNTc5Nzg2MCwiaXNzIjoiaSIsImF1ZCI6ImEifQ._CzCsaO_oDm7b6qHrU4PqoTs2Oq7ng4ybNaBjsJwjbs',\
        HttpHeaders.authorizationHeader: 'Bearer ${token}',
      }
  );

  String responseData = response.body.substring(response.body.indexOf('"Data":') + 7, response.body.length - 1);
  return compute(parseUsers, responseData);
}

List<User> parseUsers(String responseBody){
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}





