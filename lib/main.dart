import 'dart:js';

import 'package:astroscope_hub/auth/auth_service.dart';
import 'package:astroscope_hub/pages/add_telescope.dart';
import 'package:astroscope_hub/pages/brand_page.dart';
import 'package:astroscope_hub/pages/dashboard_page.dart';
import 'package:astroscope_hub/pages/login_page.dart';
import 'package:astroscope_hub/pages/view_telescope_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
  final _router = GoRouter(
    initialLocation: DashboardPage.routeName,
    redirect: (context, state){
      if(AuthService.currentUser == null ){
        return LoginPage.routeName; //if login then dashboard ,if not then login page
      }
      return null;
    },
    routes: [
      GoRoute(
        name: DashboardPage.routeName,
        path: DashboardPage.routeName,
        builder: (context,state)=> DashboardPage(),

        routes: [
          GoRoute(
              name: AddTelescopePage.routeName,
              path: AddTelescopePage.routeName,
              builder: (context,state)=> AddTelescopePage(),
          ),
          GoRoute(
            name: ViewTelescopePage.routeName,
            path: ViewTelescopePage.routeName,
            builder: (context,state)=> ViewTelescopePage(),
          ),
          GoRoute(
            name: BrandPage.routeName,
            path: BrandPage.routeName,
            builder: (context,state)=> BrandPage(),
          ),
        ]
      ),
      GoRoute(
        name: LoginPage.routeName,
        path: LoginPage.routeName,
        builder: (context,state)=> LoginPage(),
      ),
    ]
  );
  
}
