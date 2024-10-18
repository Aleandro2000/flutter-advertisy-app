import 'package:advertisy/guards/authentication.guard.dart';
import 'package:advertisy/screens/splash.screen.dart';
import 'package:advertisy/utils/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  try {
    await GetStorage.init();
    runApp(const MainApp());
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late RouteGuard routeGuard;

  @override
  void initState() {
    super.initState();
    routeGuard = RouteGuard();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advertisy',
      debugShowCheckedModeBanner: kDebugMode,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: ThemeColors.seedColorTheme),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => FutureBuilder<Route<dynamic>>(
            future: routeGuard.guard(RouteSettings(name: '/login')),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                return Scaffold(
                    body: Center(child: Text('Error: ${snapshot.error}')));
              } else {
                if (snapshot.hasData) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushReplacement(snapshot.data!);
                  });
                }
                // Show an empty container while navigating
                return Container();
              }
            }),
        '/dashboard': (context) => FutureBuilder<Route<dynamic>>(
            future: routeGuard.guard(RouteSettings(name: '/dashboard')),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                return Scaffold(
                    body: Center(child: Text('Error: ${snapshot.error}')));
              } else {
                if (snapshot.hasData) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushReplacement(snapshot.data!);
                  });
                }
                // Show an empty container while navigating
                return Container();
              }
            }),
      },
    );
  }
}
