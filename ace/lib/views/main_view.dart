import 'package:ace/routes/view_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends GetView {
  static const String route = '/main';

  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('MainView'),
    ));
  }
}
