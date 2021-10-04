// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internative_cs/models/users.dart';

Future<List<User>> fetchUsers(http.Client client, String tokenValue) async{
  final response = await client
      .get(
      Uri.parse('http://test11.internative.net/User/GetUsers'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${tokenValue}',
      }
  );

  String responseData = response.body.substring(response.body.indexOf('"Data":') + 7, response.body.length - 1);
  return compute(parseUsers, responseData);
}

List<User> parseUsers(String responseBody){
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<User>((json) => User.fromJson(json)).toList();
}





