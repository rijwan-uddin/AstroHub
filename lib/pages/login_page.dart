import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
            key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(24.0),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'provide a valid email address';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.password),
                  labelText: 'Password (at least 6 characters)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'provide  valid password';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: _authenticate, child: Text('Login as admin'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_errMsg , style : TextStyle(fontSize: 18, color:Colors.red)),
            ),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticate() async {}
}
