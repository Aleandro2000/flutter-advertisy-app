import 'dart:convert';
import 'dart:async';

import 'package:advertisy/models/posts.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<PostsModel?> getPosts() async {
  try {
    if (kDebugMode) {
      print("Start fetching...");
    }

    final response = await http
        .get(
      Uri.https("dummyjson.com", "posts"),
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

    return PostsModel.fromJson(jsonDecode(response.body));
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
  return null;
}
