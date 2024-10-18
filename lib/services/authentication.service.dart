import 'dart:convert';
import 'dart:async';

import 'package:advertisy/models/token.model.dart';
import 'package:advertisy/models/user.model.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

Future<UserModel?> login(String username, String password) async {
  try {
    if (kDebugMode) {
      print("Start fetching...");
    }
    final storage = GetStorage();
    final response = await http
        .post(
      Uri.https("dummyjson.com", "auth/login"),
      headers: {"Content-Type": "application/json"},
      body: '{"username": "$username", "password": "$password"}',
    )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        return http.Response('Connection Timeout', 408);
      },
    );

    if (kDebugMode) {
      print("End fetching...");
    }

    if (response.statusCode == 200) {
      final userModel = UserModel.fromJson(jsonDecode(response.body));

      await storage.write('access_token', userModel.accessToken);
      await storage.write('refresh_token', userModel.refreshToken);

      return userModel;
    } else {
      if (kDebugMode) {
        print("Login failed: ${response.reasonPhrase}");
      }
    }
  } catch (err) {
    if (kDebugMode) {
      print("Error during login: $err");
    }
  }
  return null;
}

Future<TokenModel?> refreshToken() async {
  try {
    if (kDebugMode) {
      print("Start fetching...");
    }
    final storage = GetStorage();
    String refreshToken = await storage.read('refresh_token');
    final response = await http
        .post(
      Uri.https("dummyjson.com", "auth/login"),
      headers: {"Content-Type": "application/json"},
      body: '{"refreshToken": "$refreshToken"}',
    )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        return http.Response('Connection Timeout', 408);
      },
    );

    if (kDebugMode) {
      print("End fetching...");
    }

    if (response.statusCode == 200) {
      final tokenModel = TokenModel.fromJson(jsonDecode(response.body));

      await storage.write('access_token', tokenModel.accessToken);
      await storage.write('refresh_token', tokenModel.refreshToken);

      return tokenModel;
    } else {
      if (kDebugMode) {
        print("Login failed: ${response.reasonPhrase}");
      }
    }
  } catch (err) {
    if (kDebugMode) {
      print("Error during login: $err");
    }
  }
  return null;
}

Future<void> logout() async {
  try {
    final storage = GetStorage();
    await storage.erase();
  } catch (err) {
    if (kDebugMode) {
      print("Error during logout: $err");
    }
  }
}

Future<bool> isLogin() async {
  try {
    final storage = GetStorage();
    return await storage.read("access_token") != null;
  } catch (err) {
    if (kDebugMode) {
      print("Error during logout: $err");
    }
  }
  return false;
}
