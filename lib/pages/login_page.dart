//
// import 'package:astroscope_hub/auth/auth_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:go_router/go_router.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'dashboard_page.dart'; // Assuming this is your DashboardPage file
//
// class LoginPage extends StatefulWidget {
//   static const String routeName = '/login';
//
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   String _errMsg = '';
//   String _infoMsg = ''; // This variable will store the info message
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             padding: EdgeInsets.all(24.0),
//             shrinkWrap: true,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     filled: true,
//                     prefixIcon: Icon(Icons.email),
//                     labelText: 'Email Address',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Provide a valid email address';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     filled: true,
//                     prefixIcon: Icon(Icons.password),
//                     labelText: 'Password (at least 6 characters)',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Provide a valid password';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: _authenticate,
//                 child: Text('Login as admin'),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   _errMsg,
//                   style: TextStyle(fontSize: 18, color: Colors.red),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: showtext,
//                 child: Text('See Email and Pass'),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   _infoMsg, // Display the info message here
//                   style: TextStyle(fontSize: 18, color: Colors.blue),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   void _authenticate() async {
//     if (_formKey.currentState!.validate()) {
//       EasyLoading.show(status: 'Please wait');
//       final email = _emailController.text;
//       final pass = _passwordController.text;
//       try {
//         final status = await AuthService.loginAdmin(email, pass);
//         EasyLoading.dismiss();
//         if (status) {
//           context.goNamed(DashboardPage.routeName);
//         } else {
//           await AuthService.logout();
//           setState(() {
//             _errMsg = 'This is not an Admin account';
//           });
//         }
//       } on FirebaseAuthException catch (error) {
//         EasyLoading.dismiss();
//         setState(() {
//           _errMsg = error.message!;
//         });
//       }
//     }
//   }
//
//   void showtext() {
//     setState(() {
//       _infoMsg = 'Em: admin@gmail.com  Pass: 123456';
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/auth_service.dart';
 // Assuming this is your AuthService file
import 'dashboard_page.dart'; // Assuming this is your DashboardPage file

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
  String _infoMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Welcome !',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Please login to your admin account',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Provide a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                      labelText: 'Password (at least 6 characters)',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Provide a valid password';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _authenticate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: Text(
                    'Login as admin',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                if (_errMsg.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      _errMsg,
                      style: TextStyle(fontSize: 18, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: showtext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: Text(
                    'See Email and Pass',
                    style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                  ),
                ),
                if (_infoMsg.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      _infoMsg,
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticate() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait');
      final email = _emailController.text;
      final pass = _passwordController.text;
      try {
        final status = await AuthService.loginAdmin(email, pass);
        EasyLoading.dismiss();
        if (status) {
          context.goNamed(DashboardPage.routeName);
        } else {
          await AuthService.logout();
          setState(() {
            _errMsg = 'This is not an Admin account';
          });
        }
      } on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        setState(() {
          _errMsg = error.message!;
        });
      }
    }
  }

  void showtext() {
    setState(() {
      _infoMsg = 'Em: admin@gmail.com  Pass: 123456';
    });
  }
}
