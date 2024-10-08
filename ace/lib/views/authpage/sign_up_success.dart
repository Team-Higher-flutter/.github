import 'package:ace/controller/avatar_controller.dart';
import 'package:ace/routes/pages.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/button.dart';
import 'package:ace/utils/image_size_config.dart';

import 'package:ace/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(
    home: const SignUpSuccess(),
    getPages: AppPages.pages,
  ));
}

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    ImageSizeConfig sizeConfig = ImageSizeConfig(context);

    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/login/signupsuccess.svg',
              height: sizeConfig.imageHeight,
              width: sizeConfig.imageWidth,
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(ViewRoute.profile);
              },
              child: Text('프로필 작성하기', style: AppTypograpy.button36Regular),
              style: AppButton.xLarge,
            )
          ],
        ),
      )),
    );
  }
}
