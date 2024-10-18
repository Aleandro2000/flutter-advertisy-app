import 'package:advertisy/screens/posts.screen.dart';
import 'package:advertisy/screens/products.screen.dart';
import 'package:advertisy/services/authentication.service.dart';
import 'package:advertisy/utils/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const PostsScreen(),
    const ProductsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _logout() async {
    try {
      await logout();
      if (mounted) {
        Navigator.of(context).pushReplacementNamed("/login");
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: ThemeColors.backgroundNavbarTheme,
        titleTextStyle: TextStyle(
          color: ThemeColors.colorTextNavbarTheme,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: ThemeColors.colorTextNavbarTheme,
            ),
            tooltip: 'Logout',
            onPressed: _logout,
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: ThemeColors.selectedNavbarItem,
        unselectedItemColor: ThemeColors.unselectedNavbarItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Products',
          ),
        ],
      ),
    );
  }
}
