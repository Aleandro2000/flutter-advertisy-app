import 'package:advertisy/models/user.model.dart';
import 'package:advertisy/services/authentication.service.dart';
import 'package:advertisy/utils/color.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _login() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        UserModel? user = await login(
            _usernameController.text.trim(), _passwordController.text.trim());
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logging in...'),
              backgroundColor: ThemeColors.seedColorTheme,
            ),
          );
          if (user != null) {
            Navigator.of(context).pushReplacementNamed("/dashboard");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Loged in successfully! :)'),
                backgroundColor: ThemeColors.seedColorTheme,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Error! Something was wrong!'),
                  backgroundColor: ThemeColors.seedColorTheme),
            );
          }
        }
      }
    } catch (err) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Error! Something was wrong!'),
              backgroundColor: ThemeColors.seedColorTheme),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsetsDirectional.symmetric(),
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  "assets/logo.png",
                  width: 100,
                  height: 100,
                ),
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(10)),
                child: _isLoading
                    ? const SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator())
                    : const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
