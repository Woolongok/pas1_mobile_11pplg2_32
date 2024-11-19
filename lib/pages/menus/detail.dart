import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_32/local_database/localDBService.dart';
import 'package:pas1_mobile_11pplg2_32/models/league.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/mobile_layout/details_mobile.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/tablet_layout/details_tablet.dart';

import '../../controllers/responsive_controller.dart';

class Detail extends StatelessWidget {
  Detail({
    super.key,
    required this.model,
  });
  final ResponsiveController responsiveController =
      Get.put(ResponsiveController());
  Teams model;
  @override
  Widget build(BuildContext context) {
    Get.put(LocalDBService());
    return LayoutBuilder(
      builder: (context, constraints) {
        final responsiveController = Get.find<ResponsiveController>();
        final screenWidth = constraints.maxWidth;
        responsiveController.updateScreenWidth(screenWidth);
        if (responsiveController.isMobile()) {
          return DetailsMobile(
            model: model,
          );
        } else if (responsiveController.isTablet()) {
          return DetailsTablet(
            model: model,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
