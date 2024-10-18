import 'package:advertisy/screens/dashboard.screen.dart';
import 'package:advertisy/screens/login.screen.dart';
import 'package:advertisy/services/authentication.service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteGuard {
  Future<Route<dynamic>> guard(RouteSettings settings) async {
    try {
      if (await isLogin()) {
        await refreshToken();
        return MaterialPageRoute(builder: (context) => DashboardScreen());
      } else {
        return MaterialPageRoute(builder: (context) => LoginScreen());
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}
