import 'dart:convert';
import 'dart:async';

import 'package:advertisy/models/products.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<ProductsModel?> getProducts() async {
  try {
    if (kDebugMode) {
      print("Start fetching...");
    }
    final response = await http
        .get(
      Uri.https("dummyjson.com", "products"),
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
    return ProductsModel.fromJson(jsonDecode(response.body));
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
  return null;
}
