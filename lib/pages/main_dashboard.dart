import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_32/local_database/localDBService.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/NormalList.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/friendlist.dart';
import 'package:pas1_mobile_11pplg2_32/pages/menus/profile_menu.dart';

import '../controllers/dashboard_controller.dart';
import '../widgets/my_colors.dart';

class MainDashboard extends StatelessWidget {
  MainDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());
    Get.put(LocalDBService());
    final List<Widget> menus = [NormalList(), Friendlist(), ProfileMenu()];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: (index) => dashboardController.changeMenu(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Profile',
            ),
          ],
          selectedItemColor: creamdarker,
          unselectedItemColor: whiteish,
          backgroundColor: darkgray,
        ),
      );
    });
  }
}
