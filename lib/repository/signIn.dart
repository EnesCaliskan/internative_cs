// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<String> signIn(String email, String password) async{
  final response = await http.post(
    Uri.parse('http://test11.internative.net/Login/SignIn'),
    headers: {
      'accept': '*/*',
      'Content-Type': 'application/json'
    },
    body: jsonEncode(<String, String>{
     "Email" : email,
     "Password" : password,
  }),
  );

  if(response.statusCode == 200){
    String responseData = response.body.substring(response.body.lastIndexOf('"Token":') -1, response.body.length - 1);

    Map<String, dynamic> token = jsonDecode(responseData);

   return token['Token'];


  }
  else{
    throw Exception('Failed to sign in');
  }

  
}

