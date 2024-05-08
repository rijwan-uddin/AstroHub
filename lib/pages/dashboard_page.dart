import 'package:astroscope_hub/auth/auth_service.dart';
import 'package:astroscope_hub/customwidgets/dashboard_item_view.dart';
import 'package:astroscope_hub/models/dashboard_model.dart';
import 'package:astroscope_hub/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/';

  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DashboardPage'),
          actions: [
            IconButton(
              onPressed: () {
                AuthService.logout()
                    .then((value) => context.goNamed(LoginPage.routeName));
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: dashboardModelList.length,
          itemBuilder: (context, index) {
            final model = dashboardModelList[index];
            return DashboardItemView(
              model: model,
              onPress: (route) {
                context.goNamed(route);
              },
            );
          },
        ));
    ;
  }
}
