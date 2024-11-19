import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_32/local_database/localDBService.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/mobile_layout/favoite_mobile.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/mobile_layout/normal_mobile.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/tablet_layout/favorite_tablet.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/tablet_layout/normal_tablet.dart';

import '../../controllers/responsive_controller.dart';

class Friendlist extends StatelessWidget {
  Friendlist({super.key});
  final ResponsiveController responsiveController =
      Get.put(ResponsiveController());

  @override
  Widget build(BuildContext context) {
    Get.put(LocalDBService());
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsiveController = Get.find<ResponsiveController>();
        final screenWidth = constraints.maxWidth;
        responsiveController.updateScreenWidth(screenWidth);
        if (responsiveController.isMobile()) {
          return FavoriteMobile();
        } else if (responsiveController.isTablet()) {
          return FriendTablet();
        } else {
          return Container();
        }
      },
    );
  }
}
