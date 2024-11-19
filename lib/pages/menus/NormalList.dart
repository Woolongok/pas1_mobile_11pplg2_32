import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/mobile_layout/normal_mobile.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/tablet_layout/normal_tablet.dart';

import '../../controllers/responsive_controller.dart';

class NormalList extends StatelessWidget {
  NormalList({super.key});
  final ResponsiveController responsiveController =
      Get.put(ResponsiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final responsiveController = Get.find<ResponsiveController>();
          final screenWidth = constraints.maxWidth;
          responsiveController.updateScreenWidth(screenWidth);
          if (responsiveController.isMobile()) {
            return NormalMobile();
          } else if (responsiveController.isTablet()) {
            return NormalTablet();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
