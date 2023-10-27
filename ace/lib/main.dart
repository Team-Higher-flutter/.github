import 'package:ace/routes/view_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/authpage/login.dart';
import 'views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: ViewRoute.mainPage,
        initialBinding: BindingsBuilder(() {
          // Get.lazyPut(() => null);
        }),
        getPages: [
          GetPage(name: ViewRoute.mainPage, page: () => const MainView()),
          GetPage(name: ViewRoute.loginPage, page: () => const LoginView()),
        ]);
  }
}
